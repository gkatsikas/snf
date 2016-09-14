//============================================================================
//        Name: classifier_test.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: A generator of Click code that contains complex IPClassifiers.
//============================================================================

#include <random>
#include <fstream>
#include <cstdlib>
#include <iostream>

#include "../shared/helpers.hpp"
#include "../traffic_class_builder/filter.hpp"

#define MAX_NUMBER_CLASSES 1025
#define REMOVED_ADDRESSES  5
#define ALLOWED_PORTS      5

int main () {
	int size = 1;

	std::vector<std::string> position = {"first","middle","end"};

	std::default_random_engine generator;
	std::uniform_int_distribution<uint16_t> distribution(0,0xffff);

	std::ofstream myfile;

	TrafficClass test_tc;
	test_tc.intersect_filter(Filter(ip_dst,aton("200.0.0.2")));
	test_tc.intersect_filter(Filter(tp_dst_port, 1234));
	test_tc.intersect_filter(Filter(ip_proto,17));

	while (size < MAX_NUMBER_CLASSES) {
		for(size_t i=0; i<3; i++) {
			myfile.open(
				"nf_repo/class/templates/new_class_test_"+std::to_string(size)+"_"+position[i]+".click",
				std::ios::out
			);

			myfile<<"ipclassifier :: IPClassifier(\n";
			for(int j=0; j<size; j++) {
				if ((i==0 && j==0) || (i==1 && j==size/2) || (i==2 && j==size-1)){
					myfile<<"\t"<<test_tc.to_ip_classifier_pattern()<<",\n";
					continue;
				}

				TrafficClass tc;
				uint32_t base_address = aton(std::to_string(j)+".0.0.0");
				Filter f= Filter::get_filter_from_v4_prefix(ip_dst, base_address, 8);

				uint16_t dice_roll;

				for(int k=0; k<REMOVED_ADDRESSES; k++) {
					dice_roll = distribution(generator);
					f.differentiate(Filter(ip_dst,base_address + dice_roll));
				}

				tc.intersect_filter(f);

				f = Filter(tp_dst_port);
				f.make_none();

				for(int k=0; k<ALLOWED_PORTS; k++) {
					dice_roll = distribution(generator);
					f.unite(Filter(tp_dst_port,dice_roll));
				}

				tc.intersect_filter(f);

				myfile<<"\t"<<tc.to_ip_classifier_pattern()<<",\n";
			}
			myfile<<");\n\n";

			myfile<<"// Performance Testers\n";
			myfile<<"setIPClas :: SetCycleCount;\n";
			for(int i=0; i<size; i++) {
				myfile<<"getIPClas"<<i<<" :: CycleCountAccum;\n";
			}
			myfile<<"\nstrip -> markIPHeader -> setIPClas -> [0]ipclassifier;\n\n";

			for(int i=0; i<size; i++) {
				myfile<<"ipclassifier["<<i<<"] -> getIPClas"<<i<<" -> Discard ();\n";
			}

			myfile.close();
		}
		size *= 2;
	}

	return 0;
}
