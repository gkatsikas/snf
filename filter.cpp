#include <algorithm>  //std::set_intersection std::sort
#include <iostream> //std::cerr
#include <climits> //UINT_MAX
#include <cstdio>
#include <functional>

#include "filter.hpp"
#include "helpers.hpp"
#include "click_element.hpp"
#include "output_class.hpp"

#define BUG(A) std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] "<<A <<std::endl; exit(1)

#define MIN(a,b) (a>b) ? b : a
#define MAX(a,b) (a>b) ? a : b

#define in_range(x,lower,upper) (x>=lower && x<=upper)
#define DEBUG(a) printf("[%s:%d] %s\n",__FILE__,__LINE__,a)

Filter::Filter() : Filter(unknown, 0, UINT32_MAX) {}

Filter::Filter(HeaderField field) : Filter(field, 0, UINT32_MAX) {}

Filter::Filter(HeaderField field,uint32_t value) : Filter(field, value, value) {}

Filter::Filter (HeaderField field, uint32_t lower_value, uint32_t upper_value) :
					m_filter(), m_field(field) {
	m_filter.add_segment(lower_value,upper_value);
}

Filter Filter::get_filter_from_v4_prefix(HeaderField field, uint32_t value, uint32_t prefix) {
	uint32_t translation = 32 - prefix;
	uint32_t lowerLimit = value & (0xffffffff << translation);
	uint32_t upperLimit = value | (0xffffffff >> prefix);

	return Filter(field, lowerLimit, upperLimit);
}

Filter Filter::get_filter_from_v4_prefix_str(HeaderField field, const std::string& prefix_as_str) {

	size_t prefix_pos = prefix_as_str.find("/");
	if (prefix_pos == std::string::npos) {
		BUG("Expected IP prefix and got: "+prefix_as_str);
	}
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
				std::cout<<"Created filter :"<<f.to_str()<<"\n";
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
	m_filter.add_seglist(filter.m_filter);
	return *this;
}

Filter& Filter::intersect (const Filter &filter) {
	m_filter.intersect_seglist(filter.m_filter);
	return *this;
}

Filter& Filter::differentiate (const Filter& filter) {
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

std::string Filter::to_ip_class_pattern() const {
	std::vector<std::pair<uint32_t,uint32_t> > segments = m_filter.get_segments();
	std::string keyword;
	switch (m_field) {
		case ip_src:
			keyword = "src net ";
			break;
		case ip_dst:
			keyword = "dst net ";
			break;
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
			return "ip ect";
		case ip_ce:
			return "ip ce";
		case ip_TTL:
			keyword = "ip ttl ";
			break;
		default:
			BUG("Cannot convert filter to classifier "+to_str());
		//TODO : Finish that			
	}
	
	return keyword;
}

bool TrafficClass::is_discarded() const {
	return (this->m_elementPath.back()->get_type() == Discard);
}

TrafficClass::TrafficClass () : m_filters(), m_writeConditions(), m_dropBroadcasts(false),
								m_ipgwoptions(false), m_etherEncapConf(), m_elementPath(), 
								m_operation() {}

std::vector<std::shared_ptr<ClickElement> > TrafficClass::synthesize_chain () {
	std::vector<std::shared_ptr<ClickElement> > synthesized_chain;
	if(this->is_discarded()) {
		synthesized_chain.push_back(std::shared_ptr<ClickElement>(new ClickElement(Discard,std::string())));
	}
	else {
		if(m_dropBroadcasts) {
			synthesized_chain.push_back(std::shared_ptr<ClickElement>(new ClickElement(DropBroadcasts,std::string())));
		}
		
		if(m_ipgwoptions) {
			synthesized_chain.push_back(std::shared_ptr<ClickElement>(new ClickElement(DropBroadcasts,std::string())));
		}
		FieldOperation* field_op;
		
		//TODO: do the voodoo that you want to do
		
		field_op = m_operation.get_field_op(mtu);
		if(field_op) {
			synthesized_chain.push_back(std::shared_ptr<ClickElement>(new ClickElement(DropBroadcasts,
											std::to_string(field_op->m_value[0]) )));
		}
		
		if(m_etherEncapConf.empty()) {
			BUG("Empty EtherEncap configuration");
		}
		synthesized_chain.push_back(std::shared_ptr<ClickElement>(new ClickElement(EtherEncap,m_etherEncapConf)));
		synthesized_chain.push_back(m_elementPath.back());
	}
	
	return synthesized_chain;
}

std::string TrafficClass::to_ip_classifier_pattern() const {
	std::string output;
	for (auto &it : m_filters) {
		output += it.second.to_ip_class_pattern() + " && ";
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

std::string TrafficClass::to_str() const {
	std::string output = "\n================= Begin Traffic Class =================\nFilters:\n";
	for_fields_in_pf(it,m_filters) {
		output += ("\t"+it->second.to_str()+"\n");
	}
	output += "Conditions on Write operations:\n";
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
