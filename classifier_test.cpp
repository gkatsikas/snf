#include "filter.hpp"
#include <cstdlib>
#include <random>
#include "helpers.hpp"

#define MAX_NUMBER_CLASSES 256
#define REMOVED_ADDRESSES  5
#define ALLOWED_PORTS      5

int main () {
	int size = 1;
	
	std::default_random_engine generator;
	std::uniform_int_distribution<uint16_t> distribution(0,0xffff);
	
	while (size < MAX_NUMBER_CLASSES) {
		std::cout<<"\n\n#######################################################################################\n\n\t";
		for(int i=0; i<size; i++) {
			TrafficClass tc;
			uint32_t base_address = aton(std::to_string(size)+".0.0.0");
			Filter f= Filter::get_filter_from_v4_prefix(ip_dst, base_address, 8);
		
			uint16_t dice_roll;
		
			for(int i=0; i<REMOVED_ADDRESSES; i++) {
				dice_roll = distribution(generator);
				f.differentiate(Filter(ip_src,base_address + dice_roll));
			}
		
			tc.intersect_filter(f);
		
			f = Filter(tp_dstPort);
			f.make_none();
		
			for(int i=0; i<ALLOWED_PORTS; i++) {
				dice_roll = distribution(generator);
				f.unite(Filter(tp_dstPort,dice_roll));
			}

			tc.intersect_filter(f);
		
			std::cout<<tc.to_ip_classifier_pattern();
			std::cout<<",\n";
		}
		
		size *= 2;
	}

	return 0;
}
