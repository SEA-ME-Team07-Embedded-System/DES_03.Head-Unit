/****************************************************************************
** Meta object code from reading C++ file 'someipmanager.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/someipmanager.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'someipmanager.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_SomeIPManager_t {
    QByteArrayData data[17];
    char stringdata0[158];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_SomeIPManager_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_SomeIPManager_t qt_meta_stringdata_SomeIPManager = {
    {
QT_MOC_LITERAL(0, 0, 13), // "SomeIPManager"
QT_MOC_LITERAL(1, 14, 10), // "rpmChanged"
QT_MOC_LITERAL(2, 25, 0), // ""
QT_MOC_LITERAL(3, 26, 7), // "uint8_t"
QT_MOC_LITERAL(4, 34, 3), // "rpm"
QT_MOC_LITERAL(5, 38, 11), // "fdisChanged"
QT_MOC_LITERAL(6, 50, 4), // "fdis"
QT_MOC_LITERAL(7, 55, 11), // "rdisChanged"
QT_MOC_LITERAL(8, 67, 4), // "rdis"
QT_MOC_LITERAL(9, 72, 12), // "speedChanged"
QT_MOC_LITERAL(10, 85, 5), // "speed"
QT_MOC_LITERAL(11, 91, 10), // "odoChanged"
QT_MOC_LITERAL(12, 102, 3), // "odo"
QT_MOC_LITERAL(13, 106, 15), // "latitudeChanged"
QT_MOC_LITERAL(14, 122, 8), // "latitude"
QT_MOC_LITERAL(15, 131, 16), // "longitudeChanged"
QT_MOC_LITERAL(16, 148, 9) // "longitude"

    },
    "SomeIPManager\0rpmChanged\0\0uint8_t\0rpm\0"
    "fdisChanged\0fdis\0rdisChanged\0rdis\0"
    "speedChanged\0speed\0odoChanged\0odo\0"
    "latitudeChanged\0latitude\0longitudeChanged\0"
    "longitude"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SomeIPManager[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       7,   70, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   49,    2, 0x06 /* Public */,
       5,    1,   52,    2, 0x06 /* Public */,
       7,    1,   55,    2, 0x06 /* Public */,
       9,    1,   58,    2, 0x06 /* Public */,
      11,    1,   61,    2, 0x06 /* Public */,
      13,    1,   64,    2, 0x06 /* Public */,
      15,    1,   67,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    6,
    QMetaType::Void, 0x80000000 | 3,    8,
    QMetaType::Void, 0x80000000 | 3,   10,
    QMetaType::Void, QMetaType::QReal,   12,
    QMetaType::Void, QMetaType::QReal,   14,
    QMetaType::Void, QMetaType::QReal,   16,

 // properties: name, type, flags
       4, 0x80000000 | 3, 0x0049590b,
       6, 0x80000000 | 3, 0x0049580b,
       8, 0x80000000 | 3, 0x0049580b,
      10, 0x80000000 | 3, 0x0049590b,
      12, QMetaType::QReal, 0x00495903,
      14, QMetaType::QReal, 0x00495903,
      16, QMetaType::QReal, 0x00495903,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,
       6,

       0        // eod
};

void SomeIPManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SomeIPManager *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->rpmChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 1: _t->fdisChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 2: _t->rdisChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 3: _t->speedChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 4: _t->odoChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        case 5: _t->latitudeChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        case 6: _t->longitudeChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (SomeIPManager::*)(uint8_t );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::rpmChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (SomeIPManager::*)(uint8_t );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::fdisChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (SomeIPManager::*)(uint8_t );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::rdisChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (SomeIPManager::*)(uint8_t );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::speedChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (SomeIPManager::*)(qreal );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::odoChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (SomeIPManager::*)(qreal );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::latitudeChanged)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (SomeIPManager::*)(qreal );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::longitudeChanged)) {
                *result = 6;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<SomeIPManager *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< uint8_t*>(_v) = _t->rpm(); break;
        case 1: *reinterpret_cast< uint8_t*>(_v) = _t->fdis(); break;
        case 2: *reinterpret_cast< uint8_t*>(_v) = _t->rdis(); break;
        case 3: *reinterpret_cast< uint8_t*>(_v) = _t->speed(); break;
        case 4: *reinterpret_cast< qreal*>(_v) = _t->odo(); break;
        case 5: *reinterpret_cast< qreal*>(_v) = _t->latitude(); break;
        case 6: *reinterpret_cast< qreal*>(_v) = _t->longitude(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<SomeIPManager *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setRpm(*reinterpret_cast< uint8_t*>(_v)); break;
        case 1: _t->setFDis(*reinterpret_cast< uint8_t*>(_v)); break;
        case 2: _t->setRDis(*reinterpret_cast< uint8_t*>(_v)); break;
        case 3: _t->setSpeed(*reinterpret_cast< uint8_t*>(_v)); break;
        case 4: _t->setOdo(*reinterpret_cast< qreal*>(_v)); break;
        case 5: _t->setLatitude(*reinterpret_cast< qreal*>(_v)); break;
        case 6: _t->setLongitude(*reinterpret_cast< qreal*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject SomeIPManager::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_SomeIPManager.data,
    qt_meta_data_SomeIPManager,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *SomeIPManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SomeIPManager::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_SomeIPManager.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int SomeIPManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 7;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void SomeIPManager::rpmChanged(uint8_t _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void SomeIPManager::fdisChanged(uint8_t _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void SomeIPManager::rdisChanged(uint8_t _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void SomeIPManager::speedChanged(uint8_t _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void SomeIPManager::odoChanged(qreal _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void SomeIPManager::latitudeChanged(qreal _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void SomeIPManager::longitudeChanged(qreal _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
