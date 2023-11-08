#include <iostream>
#include <vsomeip/vsomeip.hpp>

#define SAMPLE_SERVICE_ID 0x1234
#define SAMPLE_INSTANCE_ID 0x5678
#define SAMPLE_METHOD_ID 0x0421

int main() {
    auto app = vsomeip::runtime::get()->create_application();
    app->init();
    app->offer_service(SAMPLE_SERVICE_ID, SAMPLE_INSTANCE_ID);

    app->register_message_handler(SAMPLE_SERVICE_ID, SAMPLE_INSTANCE_ID, SAMPLE_METHOD_ID,
        [](const std::shared_ptr<vsomeip::message>& request) {
            std::cout << "Received a request from client!" << std::endl;

            auto response = vsomeip::runtime::get()->create_response(request);
            app->send(response);
        });

    app->start();
}
