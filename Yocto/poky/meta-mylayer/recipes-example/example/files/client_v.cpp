#include <iostream>
#include <vsomeip/vsomeip.hpp>

#define SAMPLE_SERVICE_ID 0x1234
#define SAMPLE_INSTANCE_ID 0x5678
#define SAMPLE_METHOD_ID 0x0421

int main() {
    auto app = vsomeip::runtime::get()->create_application();
    app->init();

    app->register_message_handler(SAMPLE_SERVICE_ID, SAMPLE_INSTANCE_ID, SAMPLE_METHOD_ID,
        [](const std::shared_ptr<vsomeip::message>& response) {
            std::cout << "Received a response from server!" << std::endl;
        });

    app->request_service(SAMPLE_SERVICE_ID, SAMPLE_INSTANCE_ID);

    auto request = vsomeip::runtime::get()->create_request(false);
    request->set_service(SAMPLE_SERVICE_ID);
    request->set_instance(SAMPLE_INSTANCE_ID);
    request->set_method(SAMPLE_METHOD_ID);
    app->send(request);

    app->start();
}
