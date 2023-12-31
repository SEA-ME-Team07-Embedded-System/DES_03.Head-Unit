#include <iostream>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <linux/can.h>
#include <thread>
#include <chrono>
int main()
{
    int s;
    int cnt = 0;
    struct sockaddr_can addr;
    struct ifreq ifr;
    struct can_frame frame;

    s = socket(PF_CAN, SOCK_RAW, CAN_RAW);
    strcpy(ifr.ifr_name, "vcan0");
    ioctl(s, SIOCGIFINDEX, &ifr);

    addr.can_family = AF_CAN;
    addr.can_ifindex = ifr.ifr_ifindex;
    bind(s, (struct sockaddr *)&addr, sizeof(addr));

    frame.can_id = 0x063; // Set CAN ID
    frame.can_dlc = 8;    // Set data length
    frame.data[0] = 0x00; // Set data
    frame.data[1] = 0x00;
    frame.data[2] = 0x03;
    frame.data[3] = 0x04;
    frame.data[4] = 0x05;
    frame.data[5] = 0x06;
    frame.data[6] = 0x07;
    frame.data[7] = 0x08;

    while (true) // Infinite loop to keep sending data
    {
    frame.data[2] = cnt;
    int bytes_sent = write(s, &frame, sizeof(frame));
    std::cout << "Sent " << cnt << "&" << bytes_sent << " bytes" << std::endl;

    cnt += 10;

    if (cnt > 500)
        cnt = 0; // Reset cnt when it exceeds 50

    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }

    return 0;
}
