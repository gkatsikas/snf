#include <string>
#include <cstdint>
#include <iostream>

#include "filter.hpp"
#include "ip_filter_parser.hpp"

#define BUG(A) std::cerr<<"["<<__FILE__<<":"<<__LINE__<<"] ERROR: "<<A \
				<<std::endl; \
				exit(1)

#define insert_last(container,containee) container.insert(container.end(), \
														containee.begin(), \
														containee.end())

Filter filter_from_option (Primitive primitive, Option option, std::string& arg) {
	switch (primitive) {
		case Primitive::IP:
			return filter_from_ip_option (option, arg);
		case Primitive::SRC:
		case Primitive::DST:
		case Primitive::TCP:
			break;
		default:
			BUG("Undefined primitive");
	}
	return Filter();
}

Filter filter_from_ip_option (Option option, std::string& arg) {
	switch (option) {
		case Option::IP_PROTO:
			if (!arg.compare("tcp")) {
				return Filter(ip_proto,	6);		
			}
			else if (!arg.compare("udp")) {
				return Filter(ip_proto, 6);
			}
			else if(!arg.compare("icmp")) {
				return Filter(ip_proto,1);
			}
			else if (arg.find_first_not_of("0123456789") == std::string::npos) {
				return Filter::get_filter_from_ipclass_pattern(ip_proto,arg);
			}
			else {
				BUG("Unknown protocol name: "<<arg);
			}
		case Option::IP_VERS:
			return Filter::get_filter_from_ipclass_pattern(ip_ver,arg);
		case Option::IP_HL:
			return Filter::get_filter_from_ipclass_pattern(ip_ihl,arg);
		case Option::IP_ID:
			return Filter::get_filter_from_ipclass_pattern(ip_id,arg);
		case Option::IP_TOS:
			BUG("ip tos not supported, please use ip dscp and ip ect/ce");
		case Option::IP_DSCP:
			return Filter::get_filter_from_ipclass_pattern(ip_dscp,arg);
		case Option::IP_ECT:
			return Filter(ip_ect,1);
		case Option::IP_CE:
			return Filter(ip_ce,1);
		case Option::IP_TTL:
			return Filter::get_filter_from_ipclass_pattern(ip_TTL,arg);
		case Option::IP_FRAG:
		case Option::IP_UNFRAG:
			BUG("IP fragmentation not supported yet");
		default:
			BUG("Unknown option for IP primitive");
	}
}

void negate_pf (PacketFilter& pf) {
	for (auto &it : pf) {
		pf[it.first] = (Filter(it.first)).differentiate(it.second);
	}
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
				return Primitive::Undefined;
		}
	}
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
					
				}
			case 'v':
				if (!str.compare("vers")) {
					return Option::IP_VERS;
				}
				break;
			default:
				return Option::Undefined;
		}
	}
}

bool is_operator (Primitive prim) {
	return (prim==Primitive::OR || prim==Primitive::AND);
}

//TODO: complete that
Option srcdst_option_from_string(std::string str) {}

Option tcp_option_from_string(std::string str) {}

Option option_from_string(Primitive curr_prim, std::string str) {
	switch (curr_prim) {
		case Primitive::IP:
			ip_option_from_string(str);
		case Primitive::SRC:
		case Primitive::DST:
			srcdst_option_from_string(str);
		case Primitive::TCP:
			tcp_option_from_string(str);
		default:
			BUG("Undefined primitive, cannot parse option");
	}
}

std::string parse_value (char** position, char* end) {
	std::string current_word;
	std::string value;
	std::string temp;
	char* current_position = *position;
	
	while (current_position != end) {
		if (*current_position == ' ') {
			Primitive p = primitive_from_string(current_word);
			if( p != Primitive::Undefined && !is_operator(p) ){ //New primitive, end of the value
				break;
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
		else {
			current_word.push_back(*current_position);
		}
		current_position++;
	}
	if(current_position == end) {
		value += current_word;
		*position = end;
	}
	else {
		value.pop_back();
		(*position)++;
	}
	return value;
}

std::vector<PacketFilter> filters_from_substr (char** position, char* end,
												PacketFilter& current_filter) {

/*
 * TODO: 
 * - support pattern that are not of the type "primitive option [value]"
 * - Add a PacketFilter containing the current filter and wait for "or" that
 *   change the primitive to push it into open_filters
 *   ll 287 && 312
 */

	std::vector<PacketFilter> finished_filters;
	std::vector<PacketFilter> open_filters;

	if (*position==end) {
		insert_last(finished_filters, open_filters);
		return finished_filters;
	}
	
	std::string current_word;
	bool negate=false;
	Primitive curr_prim = Primitive::Undefined;
	Option curr_opt = Option::Undefined;
	Filter curr_filter;
	while (*position != end && **position != ')') {
		if (**position == '!') {
			negate=true;
			(*position)++;
		}
		else if(**position == '(') {
			(*position)++;
			//FIXME : not necessarily, we might want to wait for the next one
			PacketFilter pf = filters_from_substr(position, end, current_filter));
			if (negate) {
				negate_pf(pf);
			}
		}
		else if(**position == ' ') {
			(*position)++;
			if (curr_prim == Primitive::Undefined) {//Current word is a primitive
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
					default:
						value = parse_value(position,end);						
				}
				Filter f = filter_from_option (curr_prim, curr_opt, value);
				if (negate) {
					f = (Filter()).differentiate(f);
					negate = false;
				}
				//go to next step
			}
			current_word.clear();
		}
		else {
			current_word.push_back(**position);
		}
	}
	(*position)++;
	insert_last(finished_filters, open_filters);
	return finished_filters;
	
}

std::vector<PacketFilter> filters_from_ipfilter_line (std::string line) {
	PacketFilter pf;
	if (!line.size()) {
		BUG("Empty IPFilter configuration");
	}
	char* start = &(line[0]);
	return filters_from_substr (&start, start+line.size(), pf);
}

//#define test
#ifdef test
int main() {
	std::string a = "1234 or 4567 or 789 and tcp port";
	char* start = &(a[0]);
	char* end = start+a.size();
	char** r_start = &start;
	std::cout<<parse_value(r_start, end)<<std::endl;
	std::cout<<"Suffix: ";
	while (*r_start != end) {
		std::cout<<**r_start;
		(*r_start)++;
	}
	std::cout<<std::endl;
}
#endif
