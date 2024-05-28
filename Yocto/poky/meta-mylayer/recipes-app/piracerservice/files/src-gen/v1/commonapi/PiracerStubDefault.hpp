/*
* This file was generated by the CommonAPI Generators.
* Used org.genivi.commonapi.core 3.2.0.v202012010850.
* Used org.franca.core 0.13.1.201807231814.
*
* This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
* If a copy of the MPL was not distributed with this file, You can obtain one at
* http://mozilla.org/MPL/2.0/.
*/
#ifndef V1_COMMONAPI_Piracer_STUB_DEFAULT_HPP_
#define V1_COMMONAPI_Piracer_STUB_DEFAULT_HPP_


#include <CommonAPI/Export.hpp>

#include <v1/commonapi/PiracerStub.hpp>
#include <cassert>
#include <sstream>

# if defined(_MSC_VER)
#  if _MSC_VER >= 1300
/*
 * Diamond inheritance is used for the CommonAPI::Proxy base class.
 * The Microsoft compiler put warning (C4250) using a desired c++ feature: "Delegating to a sister class"
 * A powerful technique that arises from using virtual inheritance is to delegate a method from a class in another class
 * by using a common abstract base class. This is also called cross delegation.
 */
#    pragma warning( disable : 4250 )
#  endif
# endif

namespace v1 {
namespace commonapi {

/**
 * Provides a default implementation for PiracerStubRemoteEvent and
 * PiracerStub. Method callbacks have an empty implementation,
 * remote set calls on attributes will always change the value of the attribute
 * to the one received.
 *
 * Override this stub if you only want to provide a subset of the functionality
 * that would be defined for this service, and/or if you do not need any non-default
 * behaviour.
 */
class COMMONAPI_EXPORT_CLASS_EXPLICIT PiracerStubDefault
    : public virtual PiracerStub {
public:
    COMMONAPI_EXPORT PiracerStubDefault()
        : remoteEventHandler_(this),
          interfaceVersion_(Piracer::getInterfaceVersion()) {
    }

    COMMONAPI_EXPORT const CommonAPI::Version& getInterfaceVersion(std::shared_ptr<CommonAPI::ClientId> _client) {
        (void)_client;
        return interfaceVersion_;
    }

    COMMONAPI_EXPORT PiracerStubRemoteEvent* initStubAdapter(const std::shared_ptr< PiracerStubAdapter> &_adapter) {
        CommonAPI::Stub<PiracerStubAdapter, PiracerStubRemoteEvent>::stubAdapter_ = _adapter;
        return &remoteEventHandler_;
    }

    COMMONAPI_EXPORT virtual const uint8_t &getBatteryAttribute() {
        return batteryAttributeValue_;
    }
    COMMONAPI_EXPORT virtual const uint8_t &getBatteryAttribute(const std::shared_ptr<CommonAPI::ClientId> _client) {
        (void)_client;
        return getBatteryAttribute();
    }
    COMMONAPI_EXPORT virtual void setBatteryAttribute(uint8_t _value) {
        const bool valueChanged = trySetBatteryAttribute(std::move(_value));
        if (valueChanged) {
            fireBatteryAttributeChanged(batteryAttributeValue_);
        }
    }
    COMMONAPI_EXPORT virtual const uint8_t &getGearAttribute() {
        return gearAttributeValue_;
    }
    COMMONAPI_EXPORT virtual const uint8_t &getGearAttribute(const std::shared_ptr<CommonAPI::ClientId> _client) {
        (void)_client;
        return getGearAttribute();
    }
    COMMONAPI_EXPORT virtual void setGearAttribute(uint8_t _value) {
        const bool valueChanged = trySetGearAttribute(std::move(_value));
        if (valueChanged) {
            fireGearAttributeChanged(gearAttributeValue_);
        }
    }
    COMMONAPI_EXPORT virtual const uint8_t &getModeAttribute() {
        return modeAttributeValue_;
    }
    COMMONAPI_EXPORT virtual const uint8_t &getModeAttribute(const std::shared_ptr<CommonAPI::ClientId> _client) {
        (void)_client;
        return getModeAttribute();
    }
    COMMONAPI_EXPORT virtual void setModeAttribute(uint8_t _value) {
        const bool valueChanged = trySetModeAttribute(std::move(_value));
        if (valueChanged) {
            fireModeAttributeChanged(modeAttributeValue_);
        }
    }
    COMMONAPI_EXPORT virtual void modeSelect(const std::shared_ptr<CommonAPI::ClientId> _client, uint8_t _modeS, modeSelectReply_t _reply) {
        (void)_client;
        (void)_modeS;
        std::string gearmessage = "";
        _reply(gearmessage);
    }
    COMMONAPI_EXPORT virtual void gearSelect(const std::shared_ptr<CommonAPI::ClientId> _client, uint8_t _gearS, gearSelectReply_t _reply) {
        (void)_client;
        (void)_gearS;
        std::string modemessage = "";
        _reply(modemessage);
    }


protected:
    COMMONAPI_EXPORT virtual bool trySetBatteryAttribute(uint8_t _value) {
        if (!validateBatteryAttributeRequestedValue(_value))
            return false;

        bool valueChanged;
        std::shared_ptr<PiracerStubAdapter> stubAdapter = CommonAPI::Stub<PiracerStubAdapter, PiracerStubRemoteEvent>::stubAdapter_.lock();
        if(stubAdapter) {
            stubAdapter->lockBatteryAttribute(true);
            valueChanged = (batteryAttributeValue_ != _value);
            batteryAttributeValue_ = std::move(_value);
            stubAdapter->lockBatteryAttribute(false);
        } else {
            valueChanged = (batteryAttributeValue_ != _value);
            batteryAttributeValue_ = std::move(_value);
        }

       return valueChanged;
    }
    COMMONAPI_EXPORT virtual bool validateBatteryAttributeRequestedValue(const uint8_t &_value) {
        (void)_value;
        return true;
    }
    COMMONAPI_EXPORT virtual bool trySetGearAttribute(uint8_t _value) {
        if (!validateGearAttributeRequestedValue(_value))
            return false;

        bool valueChanged;
        std::shared_ptr<PiracerStubAdapter> stubAdapter = CommonAPI::Stub<PiracerStubAdapter, PiracerStubRemoteEvent>::stubAdapter_.lock();
        if(stubAdapter) {
            stubAdapter->lockGearAttribute(true);
            valueChanged = (gearAttributeValue_ != _value);
            gearAttributeValue_ = std::move(_value);
            stubAdapter->lockGearAttribute(false);
        } else {
            valueChanged = (gearAttributeValue_ != _value);
            gearAttributeValue_ = std::move(_value);
        }

       return valueChanged;
    }
    COMMONAPI_EXPORT virtual bool validateGearAttributeRequestedValue(const uint8_t &_value) {
        (void)_value;
        return true;
    }
    COMMONAPI_EXPORT virtual bool trySetModeAttribute(uint8_t _value) {
        if (!validateModeAttributeRequestedValue(_value))
            return false;

        bool valueChanged;
        std::shared_ptr<PiracerStubAdapter> stubAdapter = CommonAPI::Stub<PiracerStubAdapter, PiracerStubRemoteEvent>::stubAdapter_.lock();
        if(stubAdapter) {
            stubAdapter->lockModeAttribute(true);
            valueChanged = (modeAttributeValue_ != _value);
            modeAttributeValue_ = std::move(_value);
            stubAdapter->lockModeAttribute(false);
        } else {
            valueChanged = (modeAttributeValue_ != _value);
            modeAttributeValue_ = std::move(_value);
        }

       return valueChanged;
    }
    COMMONAPI_EXPORT virtual bool validateModeAttributeRequestedValue(const uint8_t &_value) {
        (void)_value;
        return true;
    }
    class COMMONAPI_EXPORT_CLASS_EXPLICIT RemoteEventHandler: public virtual PiracerStubRemoteEvent {
    public:
        COMMONAPI_EXPORT RemoteEventHandler(PiracerStubDefault *_defaultStub)
            : 
              defaultStub_(_defaultStub) {
        }


    private:
        PiracerStubDefault *defaultStub_;
    };
protected:
    PiracerStubDefault::RemoteEventHandler remoteEventHandler_;

private:

    uint8_t batteryAttributeValue_ {};
    uint8_t gearAttributeValue_ {};
    uint8_t modeAttributeValue_ {};

    CommonAPI::Version interfaceVersion_;
};

} // namespace commonapi
} // namespace v1


// Compatibility
namespace v1_0 = v1;

#endif // V1_COMMONAPI_Piracer_STUB_DEFAULT
