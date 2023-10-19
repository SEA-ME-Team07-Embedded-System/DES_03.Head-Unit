/****************************************************************************
** Meta object code from reading C++ file 'someipmanager.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../head_unit/src/someipmanager.h"
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
    QByteArrayData data[15];
    char stringdata0[139];
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
QT_MOC_LITERAL(5, 38, 10), // "disChanged"
QT_MOC_LITERAL(6, 49, 3), // "dis"
QT_MOC_LITERAL(7, 53, 12), // "speedChanged"
QT_MOC_LITERAL(8, 66, 5), // "speed"
QT_MOC_LITERAL(9, 72, 10), // "odoChanged"
QT_MOC_LITERAL(10, 83, 3), // "odo"
QT_MOC_LITERAL(11, 87, 15), // "latitudeChanged"
QT_MOC_LITERAL(12, 103, 8), // "latitude"
QT_MOC_LITERAL(13, 112, 16), // "longitudeChanged"
QT_MOC_LITERAL(14, 129, 9) // "longitude"

    },
    "SomeIPManager\0rpmChanged\0\0uint8_t\0rpm\0"
    "disChanged\0dis\0speedChanged\0speed\0"
    "odoChanged\0odo\0latitudeChanged\0latitude\0"
    "longitudeChanged\0longitude"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SomeIPManager[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       6,   62, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   44,    2, 0x06 /* Public */,
       5,    1,   47,    2, 0x06 /* Public */,
       7,    1,   50,    2, 0x06 /* Public */,
       9,    1,   53,    2, 0x06 /* Public */,
      11,    1,   56,    2, 0x06 /* Public */,
      13,    1,   59,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    6,
    QMetaType::Void, 0x80000000 | 3,    8,
    QMetaType::Void, QMetaType::QReal,   10,
    QMetaType::Void, QMetaType::QReal,   12,
    QMetaType::Void, QMetaType::QReal,   14,

 // properties: name, type, flags
       4, 0x80000000 | 3, 0x0049590b,
       6, 0x80000000 | 3, 0x0049590b,
       8, 0x80000000 | 3, 0x0049590b,
      10, QMetaType::QReal, 0x00495903,
      12, QMetaType::QReal, 0x00495903,
      14, QMetaType::QReal, 0x00495903,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,

       0        // eod
};

void SomeIPManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SomeIPManager *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->rpmChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 1: _t->disChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 2: _t->speedChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 3: _t->odoChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        case 4: _t->latitudeChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        case 5: _t->longitudeChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
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
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::disChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (SomeIPManager::*)(uint8_t );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::speedChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (SomeIPManager::*)(qreal );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::odoChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (SomeIPManager::*)(qreal );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::latitudeChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (SomeIPManager::*)(qreal );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SomeIPManager::longitudeChanged)) {
                *result = 5;
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
        case 1: *reinterpret_cast< uint8_t*>(_v) = _t->dis(); break;
        case 2: *reinterpret_cast< uint8_t*>(_v) = _t->speed(); break;
        case 3: *reinterpret_cast< qreal*>(_v) = _t->odo(); break;
        case 4: *reinterpret_cast< qreal*>(_v) = _t->latitude(); break;
        case 5: *reinterpret_cast< qreal*>(_v) = _t->longitude(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<SomeIPManager *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setRpm(*reinterpret_cast< uint8_t*>(_v)); break;
        case 1: _t->setDis(*reinterpret_cast< uint8_t*>(_v)); break;
        case 2: _t->setSpeed(*reinterpret_cast< uint8_t*>(_v)); break;
        case 3: _t->setOdo(*reinterpret_cast< qreal*>(_v)); break;
        case 4: _t->setLatitude(*reinterpret_cast< qreal*>(_v)); break;
        case 5: _t->setLongitude(*reinterpret_cast< qreal*>(_v)); break;
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
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
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
void SomeIPManager::disChanged(uint8_t _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void SomeIPManager::speedChanged(uint8_t _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void SomeIPManager::odoChanged(qreal _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void SomeIPManager::latitudeChanged(qreal _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void SomeIPManager::longitudeChanged(qreal _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
