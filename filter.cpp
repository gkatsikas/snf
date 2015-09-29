#include <algorithm>  //std::set_intersection std::sort
#include <iostream> //std::cerr
#include <climits> //UINT_MAX
#include <cstdio>
#include <functional>

#include "filter.hpp"
#include "helpers.hpp"
#include "click_element.hpp"
#include "output_class.hpp"
#include "synthesizer/synth_nat.hpp"

#define BUG(A) std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] "<<A <<std::endl; exit(1)

#define MIN(a,b) (a>b) ? b : a
#define MAX(a,b) (a>b) ? a : b

#define in_range(x,lower,upper) (x>=lower && x<=upper)
//#define DEBUGGING
#ifdef DEBUGGING
#define DEBUG(A) std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] DEBUG: "<<A <<std::endl
#else
#define DEBUG(A) 
#endif

Filter::Filter() : Filter(unknown, 0, UINT32_MAX) {}

Filter::Filter(HeaderField field) : Filter(field, 0, UINT32_MAX) {}

Filter::Filter(HeaderField field,uint32_t value) : Filter(field, value, value) {}

Filter::Filter (HeaderField field, uint32_t lower_value, uint32_t upper_value) :
					m_filter(), m_field(field) {
	m_filter.add_segment(lower_value,upper_value);
	if(lower_value > upper_value) {BUG("Weird filter: "+to_str());}
}

Filter Filter::get_filter_from_v4_prefix(HeaderField field, uint32_t value, uint32_t prefix) {

	if(prefix > 32) {
		BUG("Prefix higher than 32");
	}
	else if(prefix==32) {
		return Filter(field,value);
	}
	uint32_t translation = 32 - prefix;
	uint32_t lowerLimit = value & (0xffffffff << translation);
	uint32_t upperLimit = value | (0xffffffff >> prefix);
	if(lowerLimit > upperLimit) {BUG("Weird filter");}
	
	return Filter(field, lowerLimit, upperLimit);
}

Filter Filter::get_filter_from_v4_prefix_str(HeaderField field, const std::string& prefix_as_str) {
	DEBUG("Parsing: "+prefix_as_str);

	size_t prefix_pos = prefix_as_str.find("/");
	uint32_t addr = aton(prefix_as_str.substr(0,prefix_pos));
	uint32_t prefix = atoi(prefix_as_str.substr(prefix_pos+1,2).c_str());
	
	
	return get_filter_from_v4_prefix(field, addr, prefix);
}

Filter Filter::get_filter_from_ipclass_pattern(HeaderField field, const std::string& args) {

	//Cases:
	//1234
	//1234-5678
	//[=<>!]= 1234
	//[<>] 1234
	//1234 or 4567
	//1234 || 1234
	std::string numbers = "0123456789";
	std::function<uint32_t(std::string)> to_uint = [](std::string a){return atoi(a.c_str()); };
	if(field==ip_src || field==ip_dst) {
		to_uint = &aton;
		numbers += ".";
	}

	size_t pos = args.find_first_not_of(numbers);
	Filter f;

	switch (pos) {
		case std::string::npos: //1234
			return Filter(field,to_uint(args));
		case 0: //either [=<>!]= 1234 or [<>] 1234
			if(args.size() < 3) {
				BUG("Wrong argument in IPFilter: "+args);
			}
			switch (args[0]) {
				case '=':
					if (args.size() < 2 || args[1]!='=') {
						BUG("Wrong argument in IPFilter: "+args+"\n\tExpected '='");
					}
					else {
						f = Filter(field,to_uint(args.substr(2,args.size()-2)));
					}
					break;
				case '<':
					switch (args[1]) {
						case '=':
							f = Filter(field,0,to_uint(args.substr(2,args.size()-2)));
							break;
						case ' ':
							f = Filter(field,0,to_uint(args.substr(2,args.size()-2))-1);
							break;
						default:
							BUG("Wrong argument in IPFilter: "+args+"\n\tExpected one of ' ' or '='");
					}
					break;
				case '>':
					switch (args[1]) {
						case '=':
							f = Filter(field,to_uint(args.substr(2,args.size()-2)), UINT32_MAX);
							break;
						case ' ':
							f = Filter(field,to_uint(args.substr(2,args.size()-2))+1, UINT32_MAX);
							break;
						default:
							BUG("Wrong argument in IPFilter: "+args+"\n\tExpected one of ' ' or '='");
					}
					break;
				case '!':
					if (args[1]!='=') {
						BUG("Wrong argument in IPFilter: "+args+"\n\tExpected '='");
					}
					else {
						f = Filter(field);
						f.differentiate(Filter(field,to_uint(args.substr(2,args.size()-2))));
					}
					break;
			}
			break;
		default: {//1234 or 1234 OR 1234-5678

			size_t start;

			if( (field==tp_srcPort || field == tp_dstPort) && args[pos] == '-') {
			//1234-5678
				uint32_t lower = to_uint(args.substr(0,pos));
				start = pos+1;
				pos = args.find_first_not_of(numbers,start);
				uint32_t upper = to_uint(args.substr(start,pos));
				f= Filter(field,lower,upper);
			}
			else {
				f = Filter(field,to_uint(args.substr(0,pos)));
			}

			start = args.find_first_of(numbers,pos);

			while (start != std::string::npos) {
				//TODO_ check that it's or/|| in the middle
				pos = args.find_first_not_of(numbers,start);

				if( (field==tp_srcPort || field == tp_dstPort) && args[pos] == '-') {
				//1234-5678
					uint32_t lower = to_uint(args.substr(start,pos));
					start = pos+1;
					pos = args.find_first_not_of(numbers,start);
					uint32_t upper = to_uint(args.substr(start,pos));
					f.unite(Filter(field,lower,upper));

				}
				else {
					f.unite(Filter(field,to_uint(args.substr(start,pos-start))));
				}
				start = args.find_first_of(numbers,pos);
			}
			return f;
		}
	}
	return f;
}

Filter Filter::get_filter_from_prefix_pattern(HeaderField field, const std::string& args) {
	std::string prefix_chars = "0123456789./";
	size_t pos = args.find_first_not_of(prefix_chars);
	Filter f;
	switch (pos) {
		case std::string::npos:
			f = get_filter_from_v4_prefix_str(field,args);
			break;
		case 0: //Either == or !=
			switch (args[0]) {
				case '=':
					if (args.size() < 2 || args[1] != '=') {
						BUG("Unknown comparator: "+args);
					}
					f = get_filter_from_v4_prefix_str(field,args.substr(2,args.size()-2));
					break;
				case '!':
					if (args.size() < 2 || args[1] != '=') {
						BUG("Unknown comparator: "+args);
					}
					f = get_filter_from_v4_prefix_str(field,args.substr(2,args.size()-2));
					f = (Filter(field)).differentiate(f);
					break;
			}
			break;
		default: {
			f.make_none();
			size_t start=0;
			while (start != std::string::npos) {
				pos = args.find_first_not_of(prefix_chars,start);
				f.unite(get_filter_from_v4_prefix_str(field,args.substr(start,pos-start)));
				start = args.find_first_of(prefix_chars,pos);
			}
		}
	}
	return f;
}

bool Filter::match(uint32_t value) const {
	return m_filter.contains(value);
}

bool Filter::contains (const Filter& filter) const{
	return m_filter.contains_seglist(filter.m_filter);
}

bool Filter::is_none() const {
	return m_filter.empty();
}

Filter& Filter::translate(uint32_t value, bool forward) {
	m_filter.translate(value,forward);
	return *this;
}

Filter& Filter::unite (const Filter &filter) {
	DEBUG("unite "+to_str());
	m_filter.add_seglist(filter.m_filter);
	return *this;
}

Filter& Filter::intersect (const Filter &filter) {
	DEBUG("intersect "+to_str()+" with "+filter.to_str());
	m_filter.intersect_seglist(filter.m_filter);
	return *this;
}

Filter& Filter::differentiate (const Filter& filter) {
	DEBUG("Differentiate"+to_str());
	m_filter.substract_seglist(filter.m_filter);
	return *this;
}

bool Filter::operator== (const Filter& rhs) const {
	return (this->m_field == rhs.m_field && this->m_filter == rhs.m_filter);
}

void Filter::make_none () {
	this->m_filter = DisjointSegmentList();
}

std::string Filter::to_str () const{
	switch (m_field) {
		case ip_src:
		case ip_dst:
			return "Filter on "+headerFieldNames[m_field]+": "+m_filter.to_ip_str();
		default:
			return "Filter on "+headerFieldNames[m_field]+": "+m_filter.to_str();
	}
}

std::string Filter::to_ip_class_pattern() const {
	std::string keyword;
	std::string output;
	switch (m_field) {
		case ip_ver:
			keyword = "ip vers ";
			break;
		case ip_src:
			keyword = "ip sip ";
			break;
			/* keyword = "src net ";
			return ip_filter_to_ip_class_pattern(keyword); */
		case ip_dst:
			keyword = "ip dip ";
			break;
			/*keyword = "dst net ";
			return ip_filter_to_ip_class_pattern(keyword);*/
		case ip_proto:
			keyword = "ip proto ";
			break;
		case ip_ihl:
			keyword = "ip ihl ";
			break;
		case ip_id:
			keyword = "ip id ";
			break;
		case ip_dscp:
			keyword = "ip dscp ";
			break;
		case ip_ect:
			if(match(1)) { return "ip ect"; }
			else { return "!(ip ect)"; }
		case ip_ce:
			if(match(1)) { return "ip ce"; }
			else { return "!(ip ce)"; }
		case ip_TTL:
			keyword = "ip ttl ";
			break;
		case tp_srcPort:
			keyword = "src port ";
			break;
		case tp_dstPort:
			keyword = "dst port ";
			break;
		case tcp_syn:
			if(match(1)) { return "syn"; }
			else {return "!(syn)"; }
		case tcp_ack:
			if(match(1)) { return "ack"; }
			else {return "!(ack)"; }
		case tcp_psh:
			if(match(1)) { return "tcp opt psh"; }
			else {return "!(tcp opt psh)"; }
		case tcp_rst:
			if(match(1)) { return "tcp opt rst"; }
			else {return "!(tcp opt rst)"; }
		case tcp_fin:
			if(match(1)) { return "tcp opt fin"; }
			else {return "!(tcp opt fin)"; }
		case tcp_urg:
			if(match(1)) { return "tcp opt urg"; }
			else {return "!(tcp opt urg)"; }
		case tcp_win:
			keyword = "tcp win ";
			break;
		default:
			BUG("Cannot convert filter to classifier "+to_str());
	}

	std::vector<std::pair<uint32_t,uint32_t> > segments = m_filter.get_segments();

	for  (auto &seg:segments) {
		//FIXME: handle IP subnets differently
		if(seg.first==seg.second) {
			output+= "("+keyword+std::to_string(seg.first)+") || ";
		}
		else {
			output += "("+keyword+">= "+std::to_string(seg.first)+" && "+keyword+
					  "<= "+std::to_string(seg.second)+") || ";
		}
	}

	return output.substr(0,output.size()-4); //Removes trailing  " || "
}

//Algorithm to decompose interval in prefixes: we take the biggest possible prefix
//containing lower and whose bounds are <= upper, then we keep going on the rest
//This would go quicker if we could detect !() patterns
std::string ip_segment_to_ip_class_pattern(std::string keyword, uint32_t lower, uint32_t upper) {

	std::string output;
	uint32_t current_low = lower;
	while(current_low <= upper) {
		int prefix_size = 32;
		while(prefix_size > 0 && (current_low>>(32-prefix_size))%2 == 0
				&& current_low + (0xffffffff>>(prefix_size-1)) <= upper) {
				prefix_size--;
		}
		output += "("+keyword+ntoa(current_low)+"/"+std::to_string(prefix_size)+") || ";
		if(prefix_size==32) current_low++;
		else current_low += (0xffffffff >> prefix_size) + 1;
		if(current_low==0){break;}
	}

	return output.substr(0,output.size()-4);
}

std::string Filter::ip_filter_to_ip_class_pattern(std::string keyword) const {
	std::string output;
	std::vector<std::pair<uint32_t,uint32_t> > segments = m_filter.get_segments();
	if(segments.empty()) {
		return "none";
	}

	for (auto &seg:segments) {
		output += ip_segment_to_ip_class_pattern(keyword, seg.first, seg.second)+" || ";
	}
	return output.substr(0,output.size()-4);
}

HeaderField Filter::get_field() const{
	return this->m_field;
}

Condition::Condition (HeaderField field, std::shared_ptr<ClickElement> elem,
		Filter filter, FieldOperation op) : m_field(field), m_element(elem),
		m_filter(filter), m_currentWrite(op) {}

bool Condition::is_same_write (const FieldOperation& op) const {
	return op==m_currentWrite;
}

bool Condition::intersect(const Filter& filter) {
	m_filter.intersect(filter);
	return m_filter.is_none();
}

bool Condition::is_none() const {
	return this->m_filter.is_none();
}

std::string Condition::to_str() const {
	return "Condition on "+m_element->to_str()+": "+m_filter.to_str();
}

bool TrafficClass::is_discarded() const {
	return (this->m_elementPath.back()->get_type() == Discard ||
			this->m_elementPath.back()->get_type() == Discard_def);
}

bool TrafficClass::is_SNATed(){
	FieldOperation* src_port = m_operation.get_field_op(tp_srcPort);
	return (src_port && src_port->m_type==WriteSF);
}

TrafficClass::TrafficClass () : m_filters(), m_writeConditions(), m_dropBroadcasts(false),
								m_ipgwoptions(false), m_etherEncapConf(), m_elementPath(),
								m_operation() {}

std::string TrafficClass::synthesize_chain () {
	std::string output;
	if(this->is_discarded()) {
		output = "Discard();";
	}
	else {
		if(m_dropBroadcasts) {
			output += "DropBroadcasts() -> ";
		}

		if(m_ipgwoptions) {
			output += "IPGWOptions($ipAddr) -> ";
		}
		
		if(m_nat) {
			output += "["+std::to_string(m_natInputPort)+"]"+m_nat->get_name()+";";
		}
		else {
			output += "[0]IPRewriter(";
			
			std::string ipsrc, tpsrc, tpdst;

			FieldOperation* field_op = m_operation.get_field_op(ip_src);
			if(field_op) {
				if(field_op->m_type == Write) {
					ipsrc = ntoa(field_op->m_value[0]);
				}
				else {
					BUG("Expected write operation");
				}
			}
			else{
				ipsrc = "-";
			}
	
			field_op = m_operation.get_field_op(tp_srcPort);
			if(field_op) {
				if(field_op->m_type == Write) {
					tpsrc = std::to_string(field_op->m_value[0]);
				}
				else {
					BUG("Expected write operation, got "+m_operation.to_str());
				}
			}
			else{
				tpsrc = "-";
			}
			
			field_op = m_operation.get_field_op(tp_dstPort);
			if(field_op) {
				if(field_op->m_type == Write) {
					tpdst = std::to_string(field_op->m_value[0]);
				}
				else {
					BUG("Expected write operation, got "+m_operation.to_str());
				}
			}
			else{
				tpdst = "-";
			}
	
			field_op = m_operation.get_field_op(ip_dst);
			if(field_op) {
				//TODO: add support for load balancing
				if(field_op->m_type == Write) {
					output += ipsrc+" "+tpsrc+" "+ntoa(field_op->m_value[0])+" "+tpdst+" ";
				}
				else if (field_op->m_type == WriteLB) {
					std::string rr_output = "RoundRobinIPMapper(";
					for (auto &ip : field_op->m_lbValues) {
						rr_output += ipsrc+" "+tpsrc+" "+ntoa(ip)+" "+tpdst+", ";
					}
					rr_output[rr_output.size()-2] = ')';
					output += rr_output;
				}
				else {
					BUG("Expected write operation, got "+m_operation.to_str());
				}
			}
			else{
				output += ipsrc+" "+tpsrc+" "+"- "+tpdst+" ";
			}
			output += ");";
		}

		/*field_op = m_operation.get_field_op(mtu);
		if(field_op) {
			synthesized_chain.push_back(std::shared_ptr<ClickElement>(new ClickElement(DropBroadcasts,
											std::to_string(field_op->m_value[0]) )));
		}

		if(m_etherEncapConf.empty()) {
			BUG("Empty EtherEncap configuration");
		}
		synthesized_chain.push_back(std::shared_ptr<ClickElement>(new ClickElement(EtherEncap,m_etherEncapConf)));
		synthesized_chain.push_back(m_elementPath.back());*/
	}

	return output;
}

std::string TrafficClass::to_ip_classifier_pattern() const {
	std::string output;
	for (auto &it : m_filters) {
		output += "("+it.second.to_ip_class_pattern() + ") && ";
	}
	return output.substr(0, output.size()-4); //Removes trailing " && "
}

int TrafficClass::intersect_filter(const Filter& filter) {
	HeaderField field = filter.get_field();
	auto got=this->m_filters.find(field);
	if(got == this->m_filters.end()) {
		this->m_filters[field]=filter;
	}
	else {
		this->m_filters[field].intersect(filter);
	}

	return (int) (this->m_filters[field].is_none());
}

int TrafficClass::intersect_condition(const Filter& condition, const FieldOperation& operation) {
	HeaderField field = condition.get_field();
	auto got=this->m_writeConditions.find(field);
	if(got == this->m_writeConditions.end() ||  !this->m_writeConditions[field].back().is_same_write(operation)) {
		this->m_writeConditions[field].push_back(
				Condition(field,this->m_elementPath.back(),condition,operation));
	}
	else {
		this->m_writeConditions[field].back().intersect(condition);
	}

	return (int) this->m_writeConditions[field].back().is_none();
}

int TrafficClass::addElement (std::shared_ptr<ClickElement> element, int port) {

	int nb_none_filters=0;
	(this->m_elementPath).push_back(element);

	if(element->get_type() == IPGWOptions) {
		this->m_ipgwoptions = true;
	}
	else if(element->get_type() == DropBroadcasts) {
		this->m_dropBroadcasts = true;
	}
	else if(element->get_type() == EtherEncap) {
		this->m_etherEncapConf = element->get_configuration();
	}

	if (port==-1) { //Last element of the chain -> no children
		return 0;
	}
	PacketFilter pf = (element->get_outputClasses()[port]).get_filter();

	for_fields_in_pf(it,pf) {
		HeaderField field = it->first;
		Filter filter = it->second;

		FieldOperation *field_op = this->m_operation.get_field_op(field);

		if (field_op) {
			uint32_t field_value = field_op->m_value[0];
			switch (field_op->m_type) {
				case Write:
					if (!filter.match(field_value)) {
						(this->m_filters[field]).make_none();
						nb_none_filters++;
					}
					break;
				case Translate: {
					Filter translated_filter = filter;
					if(field_value > 0) {
						translated_filter.translate(field_value,true);
					/* FIXME: INFEASIBLE because variable is unsigned */
					//}else if(field_value < 0) {
					//	translated_filter.translate(-field_value,false);
					}

					nb_none_filters += intersect_filter(translated_filter);
					break;
				}
				case WriteRR:
				case WriteRa:
				case WriteSF: {
					Filter write_condition(field, field_op->m_value[0], field_op->m_value[1]);
					if (! filter.contains(write_condition)) {
						write_condition.intersect (filter);
						nb_none_filters += intersect_condition (write_condition, *field_op);
						//FIXME: what if I have successive range writes?
					}
					break;
				}
				case WriteLB: {
					Filter write_condition(field);
					write_condition.make_none();
					for (auto &value : field_op->m_lbValues) {
						write_condition.unite(Filter(field,value));
					}
					if (! filter.contains(write_condition)) {
						write_condition.intersect (filter);
						nb_none_filters += intersect_condition (write_condition, *field_op);
						//FIXME: what if I have successive range writes?
					}
					break;
				}
				default:
					std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] Found non "
							"modifying operation"<<std::endl;
					exit(1);
			}
		}
		else {
			nb_none_filters+=intersect_filter(filter);
		}
	}

	this->m_operation.compose_op((element->get_outputClasses()[port]).get_operation());
	return nb_none_filters;
}

std::string TrafficClass::get_outputIface () const {
	if(!is_discarded()) {
		if(m_elementPath.size()>1) {
			std::shared_ptr<ClickElement> todev = m_elementPath.back();
			if(todev->get_type() == ToDevice) {
				return (todev->get_nfName()+","+todev->get_configuration());
			}
			else if(todev->get_type() == No_elem) {
				todev = m_elementPath[m_elementPath.size()-2];
				if(todev->get_type() == ToDevice) {
					return (todev->get_nfName()+","+todev->get_configuration());
				}
			}
		}
	}
	return "None";
	BUG("Could not provide output interface for traffic class "+to_str());
}

Operation TrafficClass::get_operation () {
	return m_operation;
}

void TrafficClass::set_nat (std::shared_ptr<SynthesizedNat> nat, unsigned short port) {
	this->m_nat = nat;
	this->m_natInputPort = port;
}

std::shared_ptr<SynthesizedNat> TrafficClass::get_nat () { return m_nat; }

unsigned short TrafficClass::get_natInputPort () { return m_natInputPort; }

std::string TrafficClass::to_str() const {
	std::string output = "\n================= Begin Traffic Class =================\nFilters:";
	output += to_ip_classifier_pattern();
	output += "\nConditions on Write operations:\n";
	for_fields_in_pf(it,m_writeConditions) {
		for(auto &condition : it->second) {
			output += ("\t"+condition.to_str()+"\n");
		}
	}
	output += m_operation.to_str();

	output += "Passed elements: \n\t";
	for (auto it : m_elementPath) {
		output += elementNames[it->get_type()];
		if (it->is_leaf()) {
			output+="\n";
		}
		else {
			output+="->";
		}
	}
	output += "=================  End Traffic Class  =================\n";
	return output;
}
