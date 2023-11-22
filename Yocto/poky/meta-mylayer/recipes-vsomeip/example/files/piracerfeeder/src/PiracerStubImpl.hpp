// PiracerStubImpl.hpp
#ifndef PIRACERSTUBIMPL_H_
#define PIRACERSTUBIMPL_H_


#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/PiracerStubDefault.hpp>

class PiracerStubImpl : public v1_0::commonapi::PiracerStubDefault
{
public:
    PiracerStubImpl();
    virtual ~PiracerStubImpl();

    // Method Call
    virtual void modeSelect(const std::shared_ptr<CommonAPI::ClientId> _client, uint8_t mode, modeSelectReply_t _reply);

    // Atrribute
    virtual void batteryPublisher(const uint8_t battery);
    virtual void gearPublisher(const uint8_t gear);
    virtual void modePublisher(const uint8_t mode);

    virtual uint8_t getMode();

    

private:
    uint8_t _battery;
    uint8_t _gear;
    uint8_t _mode;
};
#endif /* PIRACERSTUBIMPL_H_ */
