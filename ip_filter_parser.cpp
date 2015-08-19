#include <string>
#include <cstdint>
#include <iostream>
#include <cstdio>

#include "ip_filter_parser.hpp"

#define BUG(A) std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] ERROR: "<<A \
				<<std::endl; \
				exit(1)

//#define DEBUGGING
//#define test
#ifdef DEBUGGING
#define DEBUG(A) printf("[%s:%d] DEBUG: %s\n",__FILE__,__LINE__,((std::string) A).c_str())
#else
#define DEBUG(A) do {} while(0)
#endif


#define insert_last(container,containee) container.insert(container.end(), \
														containee.begin(), \
														containee.end())

std::vector<PacketFilter> negate_pf (const PacketFilter& pf) {
	std::vector<PacketFilter> pf_vec;
	for (auto &it : pf) {
		PacketFilter new_pf;
		new_pf[it.first] = (Filter(it.first)).differentiate(it.second);
		if (!new_pf[it.first].is_none()) {
			pf_vec.push_back(new_pf);
		}
	}
	return pf_vec;
}

bool add_filter_to_pf (PacketFilter& base_pf, const Filter& f) {
	HeaderField field = f.get_field ();
	auto got = base_pf.find(field);
	if(got == base_pf.end()) {
		base_pf[field] = f;
	}
	else {
		base_pf[field].intersect(f);
	}
	return base_pf[field].is_none();
}

std::vector<PacketFilter> and_pf_vec (const std::vector<PacketFilter>& a, 
									  const std::vector<PacketFilter>& b) {
	std::vector<PacketFilter> result;
	int is_none;
	PacketFilter temp_pf;
	for (auto &it1 : a) {
		for (auto &it2 : b) {
			temp_pf = it1;
			is_none = 0;
			for	(auto &filter : it2) {
				is_none += add_filter_to_pf (temp_pf, filter.second);
			}
			if (!is_none) {
				result.push_back(temp_pf);
			}
		}
	}
	return result;
}

std::vector<PacketFilter> negate_pf_vec (const std::vector<PacketFilter> &vec) {
	std::vector<PacketFilter> result;
	result.push_back(PacketFilter());
	for (auto &it : vec) {
		result = and_pf_vec(result,negate_pf(it));
	}	
	return result;
}

void reset_pf_vec(std::vector<PacketFilter>& vec) {
	vec.clear();
	vec.push_back(PacketFilter());
}

PacketFilter filter_from_option (Primitive primitive, Option option, std::string& arg) {
	switch (primitive) {
		case Primitive::IP:
			return filter_from_ip_option (option, arg);
		case Primitive::SRC:
			return filter_from_src_option (option, arg);
		case Primitive::DST:
			return filter_from_dst_option (option, arg);
		case Primitive::TCP:
			return filter_from_tcp_option(option, arg);
		default:
			BUG("Undefined primitive");
	}
	return PacketFilter();
}

PacketFilter filter_from_src_option (Option option, std::string& arg) {
	PacketFilter pf;
	Filter f;
	switch (option) {
		case Option::SRC_HOST:
			f = Filter::get_filter_from_ipclass_pattern(ip_src, arg);
			break;
		case Option::SRC_NET: 
			f = Filter::get_filter_from_prefix_pattern (ip_src, arg);
			break;
		case Option::SRC_UDP_PORT:
			f = Filter(ip_proto,17);
			add_filter_to_pf(pf,f);
			goto add_port;
		case Option::SRC_TCP_PORT:
			f = Filter(ip_proto,6);
			add_filter_to_pf(pf,f);
		case Option::SRC_PORT:
		add_port:
			f = Filter::get_filter_from_ipclass_pattern(tp_srcPort, arg);
			break;
		default:
			break;
	}
	add_filter_to_pf(pf,f);
	return pf;
}

PacketFilter filter_from_dst_option (Option option, std::string& arg) {
	PacketFilter pf;
	Filter f;
	switch (option) {
		case Option::DST_HOST:
			f = Filter::get_filter_from_ipclass_pattern(ip_dst, arg);
			break;
		case Option::DST_NET: 
			f = Filter::get_filter_from_prefix_pattern (ip_dst, arg);
			break;
		case Option::DST_UDP_PORT:
			f = Filter(ip_proto,17);
			add_filter_to_pf(pf,f);
			goto add_port;
		case Option::DST_TCP_PORT:
			f = Filter(ip_proto,6);
			add_filter_to_pf(pf,f);
		case Option::DST_PORT:
		add_port:
			f = Filter::get_filter_from_ipclass_pattern(tp_dstPort, arg);
			break;
		default:
			break;
	}
	add_filter_to_pf(pf,f);
	return pf;
}

PacketFilter filter_from_ip_option (Option option, std::string& arg) {
	PacketFilter pf;
	Filter f;
	switch (option) {
		case Option::IP_PROTO:
			if (!arg.compare("tcp")) {
				f = Filter(ip_proto, 6);				
			}
			else if (!arg.compare("udp")) {
				f = Filter(ip_proto, 6);
			}
			else if(!arg.compare("icmp")) {
				f = Filter(ip_proto,1);
			}
			else if (arg.find_first_not_of("0123456789") == std::string::npos) {
				f = Filter::get_filter_from_ipclass_pattern(ip_proto,arg);
			}
			else {
				BUG("Unknown protocol name: "<<arg);
			}
			break;
		case Option::IP_VERS:
			f = Filter::get_filter_from_ipclass_pattern(ip_ver,arg);
			break;
		case Option::IP_HL:
			f = Filter::get_filter_from_ipclass_pattern(ip_ihl,arg);
			break;
		case Option::IP_ID:
			f = Filter::get_filter_from_ipclass_pattern(ip_id,arg);
			break;
		case Option::IP_TOS:
			BUG("ip tos not supported, please use ip dscp and ip ect/ce");
		case Option::IP_DSCP:
			f = Filter::get_filter_from_ipclass_pattern(ip_dscp,arg);
			break;
		case Option::IP_ECT:
			f = Filter(ip_ect,1);
			break;
		case Option::IP_CE:
			f = Filter(ip_ce,1);
			break;
		case Option::IP_TTL:
			f = Filter::get_filter_from_ipclass_pattern(ip_TTL,arg);
			break;
		case Option::IP_FRAG:
		case Option::IP_UNFRAG:
			BUG("IP fragmentation not supported yet");
		default:
			BUG("Unknown option for IP primitive");
	}
	add_filter_to_pf(pf,f);
	return pf;
}

PacketFilter filter_from_tcp_option (Option option, std::string& arg) {
	PacketFilter pf;
	pf[ip_proto] = Filter(ip_proto, 6);
	Filter f;
	switch (option) {
		case Option::TCP_OPT:
			if(arg.empty()) {
				BUG("Empty argument for tcp opt");
			}
			switch (arg[0]) {
				case 'a':
					if(!arg.compare("ack")) {
						f = Filter(tcp_ack,1);
						break;
					}
				case 'f':
					if(!arg.compare("fin")) {
						f = Filter(tcp_fin,1);
						break;
					}
				case 'p':
					if(!arg.compare("psh")) {
						f = Filter(tcp_psh,1);
						break;
					}
				case 'r':
					if(!arg.compare("rst")) {
						f = Filter(tcp_rst,1);
						break;
					}
				case 's':
					if(!arg.compare("syn")) {
						f = Filter(tcp_syn,1);
						break;
					}
				case 'u':
					if(!arg.compare("urg")) {
						f = Filter(tcp_urg,1);
						break;
					}
					break;
				default:
					BUG("Unknown tcp option: "+arg);
			}
			break;
		case Option::TCP_WIN:
			f = Filter::get_filter_from_ipclass_pattern(tcp_win,arg);
			break;
		default:
			BUG("Unknown option for TCP primitive");
	}
	add_filter_to_pf(pf,f);
	return pf;
}

Primitive primitive_from_string (std::string str) {
	if (str.size()) {
		switch (str[0]) { //Let's make it linear
			case '&':
				if (str.size()==2 && str[1] =='&') {
					return Primitive::AND;
				}
				break;
			case '|':
				if (str.size()==2 && str[1] =='|') {
					return Primitive::OR;
				}
				break;
			case 'a':
				if (str.size() == 3 && str[1] == 'n' && str[2] == 'd') {
					return Primitive::AND;
				}
				break;
			case 'd':
				if (str.size() == 3 && str[1] == 's' && str[2] == 't') {
					return Primitive::DST;
				}
				break;
			case 'i':
				if (str.size() == 2 && str[1] == 'p') {
					return Primitive::IP;
				}
				break;
			case 'o':
				if (str.size()==2 && str[1] =='r') {
					return Primitive::OR;
				}
				break;
			case 's':
				if (str.size() == 3 && str[1] == 'r' && str[2] == 'c') {
					return Primitive::SRC;
				}
				break;
			case 't':
				if (str.size() == 3 && str[1] == 'c' && str[2] == 'p') {
					return Primitive::TCP;
				}
				break;
			default:
				break;
		}
	}
	
	return Primitive::Undefined;
}

Option ip_option_from_string(std::string str) {
	if(str.size()) {
		switch (str[0]) {
			case 'c':
				if(str.size() == 2 && str[1]=='e') {
					return Option::IP_CE;
				}
				break;
			case 'd':
				if(!str.compare("dscp")) {
					return Option::IP_DSCP;
				}
				break;
			case 'e':
				if (str.size() == 3 && str[1] == 'c' && str[2] == 't') {
					return Option::IP_ECT;
				}
				break;
			case 'f':
				if (!str.compare("frag")) {
					return Option::IP_FRAG;
				}
				break;
			case 'h':
				if(str.size() == 2 && str[1]=='l') {
					return Option::IP_HL;
				}
				break;
			case 'i':
				if(str.size() == 2 && str[1]=='d') {
					return Option::IP_ID;
				}
				break;
			case 'p':
				if (!str.compare("proto")) {
					return Option::IP_PROTO;
				}
				break;
			case 't':
				if (str.size() == 3) {
					if(str[1] == 'o' && str[2] == 's') {
						return Option::IP_TOS;
					}
					else if(str[1] == 't' && str[2]=='l') {
						return Option::IP_TTL;
					}
				}
				break;
			case 'u':
				if(!str.compare("unfrag")){
					return Option::IP_UNFRAG;
				}
				break;
			case 'v':
				if (!str.compare("vers")) {
					return Option::IP_VERS;
				}
				break;
			default:
				break;
		}
	}
	return Option::Undefined;
}

bool is_operator (Primitive prim) {
	return (prim==Primitive::OR || prim==Primitive::AND);
}

Option srcdst_option_from_string(Primitive prim, std::string str) {
	if(str.size() ) {
		switch (str[0]) {
			case 'h':
				if(!str.compare("host")) {
					if (prim == Primitive::SRC) {
						return Option::SRC_HOST;
					}
					else if (prim == Primitive::DST) {
						return Option::DST_HOST;
					}
				}
			case 'n':
				if(str.size() == 3 && str[1] == 'e' && str[2] == 't') {
					if (prim == Primitive::SRC) {
						return Option::SRC_NET;
					}
					else if (prim == Primitive::DST) {
						return Option::DST_NET;
					}
				}
			case 'p':
				if(!str.compare("port")) {
					if (prim == Primitive::SRC) {
						return Option::SRC_PORT;
					}
					else if (prim == Primitive::DST) {
						return Option::DST_PORT;
					}
				}
			case 't':
				if(str.size() == 3 && str[1] == 'c' && str[2] == 'p') {
					if (prim == Primitive::SRC) {
						return Option::SRC_TCP_PORT;
					}
					else if (prim == Primitive::DST) {
						return Option::DST_TCP_PORT;
					}
				}
			case 'u':
				if(str.size() == 3 && str[1] == 'd' && str[2] == 'p') {
					if (prim == Primitive::SRC) {
						return Option::SRC_UDP_PORT;
					}
					else if (prim == Primitive::DST) {
						return Option::DST_UDP_PORT;
					}
				}
			default:
				break;
		}
	}
	return Option::Undefined;
}

Option tcp_option_from_string(std::string str) { 
	if(str.size()) {
		switch (str[0])	{
			case 'o':
				if (str.size() == 3 && str[1] == 'p' && str[2] == 't') {
					return Option::TCP_OPT;
				}
			case 'w':
				if (str.size() == 3 && str[1] == 'i' && str[2] == 'n') {
					return Option::TCP_WIN;
				}
			default:
				break;
		}
	}	
	return Option::Undefined; 
}

Option option_from_string(Primitive curr_prim, std::string str) {
	switch (curr_prim) {
		case Primitive::IP:
			return ip_option_from_string(str);
		case Primitive::SRC:
		case Primitive::DST:
			return srcdst_option_from_string(curr_prim, str);
		case Primitive::TCP:
			return tcp_option_from_string(str);
		default:
			BUG("Undefined primitive, cannot parse option");
	}
}

bool is_opening_char (char c) {
	return (c == '(' || c == '!');
}

std::string parse_value (char** position, char* end) {
	std::string current_word;
	std::string value;
	std::string temp;
	char* current_position = *position;
	
	while (current_position != end && *current_position != ')') {
		DEBUG("Current pos in parse_value: "+ *current_position );
		if (*current_position == ' ' ) {
			Primitive p = primitive_from_string(current_word);
			if( p != Primitive::Undefined && !is_operator(p) ){ //New primitive, end of the value
				break;
				/*
				 *
				 * FIX ME: ip proto tcp -> tcp is not the primitive but the value
				 *				
				 */
			}
			else if(is_operator(p)) { //We wait to see whether the next one is a primitive or not
				temp = current_word+" ";
				current_word.clear();
			}
			else {
				*position = current_position;
				value += temp+current_word+' ';
				current_word.clear();
				temp.clear();
			}
		}
		else if (!value.empty() && is_opening_char(*current_position)) {
			break;
		}
		else {
			current_word.push_back(*current_position);
		}
		current_position++;
	}
	if(current_position == end || *current_position == ')') {
		value += temp+current_word;
		*position = current_position;
	}
	else {
		DEBUG("About to pop: \""+value+"\"");
		value.pop_back();
		(*position)++;
	}
	DEBUG("Returning: \""+value+"\"");
	return value;
}

std::vector<PacketFilter> filters_from_substr (char** position, char* end) {

/*
 * TODO: 
 * - support pattern that are not of the type "primitive option [value]"
 * - Add a PacketFilter containing the current filter and wait for "or" that
 *   change the primitive to push it into open_filters
 *   ll 287 && 312
 */

	std::vector<PacketFilter> finished_filters;
	std::vector<PacketFilter> open_filters;
	reset_pf_vec (open_filters);

	if (*position==end) {
		insert_last(finished_filters, open_filters);
		return finished_filters;
	}
	
	std::string current_word;
	bool negate=false;
	Primitive curr_prim = Primitive::Undefined;
	Primitive curr_operator = Primitive::AND;
	Option curr_opt = Option::Undefined;
	
	while (*position < end && **position != ')') {
		DEBUG("Considering character: \"" + **position+"\"");
		if (**position == '!') {
			negate=true;
			(*position)++;
		}
		else if(**position == '(') {
			(*position)++;
			
			std::vector<PacketFilter> pf_vec = filters_from_substr(position, end);
			DEBUG("Ended recursion");
			if (negate) {
				pf_vec = negate_pf_vec(pf_vec);
				negate = false;
			}
			switch (curr_operator) {
				case Primitive::AND:
					open_filters = and_pf_vec(open_filters, pf_vec);
					break;
				case Primitive::OR:
					insert_last(finished_filters, open_filters);
					open_filters = pf_vec;
					break;
				default:
					BUG("curr_operator is not an operator");
			}
			curr_operator = curr_prim = Primitive::Undefined;
			curr_opt = Option::Undefined;
			(*position)++; //Go past blank space
		}
		else if(**position == ' ') {
			(*position)++;
			if(curr_operator == Primitive::Undefined) {
				curr_operator = primitive_from_string(current_word);
				if (!is_operator(curr_operator)) {
					BUG("Expected operator and got: \""+current_word+"\"");
				}
			}
			else if (curr_prim == Primitive::Undefined) {//Current word is a primitive
				curr_prim = primitive_from_string(current_word);
			}
			else if (curr_opt == Option::Undefined) {//current word is an option
				curr_opt = option_from_string(curr_prim, current_word);
				//We expect a value OR an operator primitive
				std::string value;
				switch (curr_opt) {
					case Option::IP_ECT:
					case Option::IP_CE:
					case Option::IP_FRAG:
					case Option::IP_UNFRAG:
						break;
					case Option::SRC_UDP_PORT:
					case Option::SRC_TCP_PORT:
					case Option::DST_UDP_PORT:
					case Option::DST_TCP_PORT: 
						current_word.clear();
						while (*position < end && **position != ')' && **position != ' ') {
							current_word.push_back(**position);
							(*position)++;
						}
						if(current_word.compare("port")) {
							BUG("Expected \"port\" after "+optionNames[(size_t) curr_opt]);
						}
						(*position)++;
					default:
						value = parse_value(position,end);						
				}
				PacketFilter pf = filter_from_option (curr_prim, curr_opt, value);
				std::vector<PacketFilter> temp;
				if (negate) {
					temp = negate_pf(pf);
					negate = false;
				}
				else {
					temp.push_back(pf);
				}
				switch (curr_operator) {
					case Primitive::OR:
						insert_last(finished_filters, open_filters);
						reset_pf_vec(open_filters);
						open_filters[0] = pf;
					case Primitive::AND: {
						DEBUG("AND Operator");
						open_filters = and_pf_vec(open_filters, temp);
						break;
					}
					default:
						BUG("Expected operator");
				}
				curr_operator = curr_prim = Primitive::Undefined;
				curr_opt = Option::Undefined;				
			}
			current_word.clear();
		}
		else {
			current_word.push_back(**position);
			(*position)++;
		}
	}
	(*position)++;
	insert_last(finished_filters, open_filters);
	return finished_filters;
	
}

std::vector<PacketFilter> filters_from_ipfilter_line (std::string line) {

	if (!line.size()) {
		BUG("Empty IPFilter configuration");
	}
	char* start = &(line[0]);
	return filters_from_substr (&start, start+line.size());
}

std::string pf_vec_to_str (const std::vector<PacketFilter>& vec) {
	std::string output;
	for (size_t i=0; i<vec.size(); i++) {
		output += "Packet Filter i: \n";
		for(auto &it : vec[i]) {
			output += "\t" + it.second.to_str() + "\n";
		}
	}
	return output;
}


#ifdef test
int main() {
	//std::string addr = "!(ip ttl 5 or ip vers < 6)";
	//Filter f = Filter::get_filter_from_ipclass_pattern(ip_src,addr);
	//std::cout<<f.to_str()<<"\n";
	std::string a = "tcp opt syn && tcp win < 20";
	std::cout<<pf_vec_to_str(filters_from_ipfilter_line(a));
}
#endif
