#include <thread>
#include <CommonAPI/CommonAPI.hpp>
#include "CANStubImpl.hpp"
#define RCAN_ID 0x36
#define FCAN_ID 0x63

int main() {

    system("ip link set can0 up type can bitrate 125000");

    int s;
    int nbytes;
    struct sockaddr_can addr;
    struct ifreq ifr;
    struct can_frame frame;

    s = socket(PF_CAN, SOCK_RAW, CAN_RAW);
    strcpy(ifr.ifr_name, "vcan0");
    ioctl(s, SIOCGIFINDEX, &ifr);

    addr.can_family = AF_CAN;
    addr.can_ifindex = ifr.ifr_ifindex;
    bind(s, (struct sockaddr *)&addr, sizeof(addr));

    CommonAPI::Runtime::setProperty("LogContext", "CAN");
    CommonAPI::Runtime::setProperty("LogApplication", "CAN");
    CommonAPI::Runtime::setProperty("LibraryBase", "CAN");

    std::shared_ptr<CommonAPI::Runtime> runtime = CommonAPI::Runtime::get();

    std::string domain = "local";
    std::string instance = "can"; //instance id
    std::string connection = "team07";

    std::shared_ptr<CANStubImpl> junhoService = std::make_shared<CANStubImpl>();
    while (!runtime->registerService(domain, instance, junhoService, connection)) {
        std::cout << "Register Service failed, trying again in 100 milliseconds..." << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }

    std::cout << "Successfully Registered Service!" << std::endl;

    while (true) {
        nbytes = read(s, &frame, sizeof(struct can_frame));

        if (nbytes > 0 && frame.can_id == RCAN_ID) {
            junhoService->rpmPublisher(frame.data[0]);
            junhoService->rdisPublisher(frame.data[1]);
        }
         
        if (nbytes > 0 && frame.can_id == FCAN_ID) {
            junhoService->fdisPublisher(frame.data[2]);
        }

        for (int i = 0; i <= frame.can_dlc; i++)
			printf("%02X ",frame.data[i]);
		printf("\n");

        printf("\n");
    }
    return 0;
}
