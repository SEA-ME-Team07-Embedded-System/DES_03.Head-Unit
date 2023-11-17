/****************************************************************************
** Meta object code from reading C++ file 'piracersomeipmanager.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/piracersomeipmanager.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'piracersomeipmanager.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_PiracerSomeIPManager_t {
    QByteArrayData data[11];
    char stringdata0[107];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_PiracerSomeIPManager_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_PiracerSomeIPManager_t qt_meta_stringdata_PiracerSomeIPManager = {
    {
QT_MOC_LITERAL(0, 0, 20), // "PiracerSomeIPManager"
QT_MOC_LITERAL(1, 21, 14), // "batteryChanged"
QT_MOC_LITERAL(2, 36, 0), // ""
QT_MOC_LITERAL(3, 37, 7), // "uint8_t"
QT_MOC_LITERAL(4, 45, 7), // "battery"
QT_MOC_LITERAL(5, 53, 11), // "gearChanged"
QT_MOC_LITERAL(6, 65, 4), // "gear"
QT_MOC_LITERAL(7, 70, 11), // "modeChanged"
QT_MOC_LITERAL(8, 82, 4), // "mode"
QT_MOC_LITERAL(9, 87, 14), // "modeSelectCall"
QT_MOC_LITERAL(10, 102, 4) // "data"

    },
    "PiracerSomeIPManager\0batteryChanged\0"
    "\0uint8_t\0battery\0gearChanged\0gear\0"
    "modeChanged\0mode\0modeSelectCall\0data"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_PiracerSomeIPManager[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       3,   46, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   34,    2, 0x06 /* Public */,
       5,    1,   37,    2, 0x06 /* Public */,
       7,    1,   40,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       9,    1,   43,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    6,
    QMetaType::Void, 0x80000000 | 3,    8,

 // slots: parameters
    QMetaType::Void, QMetaType::UChar,   10,

 // properties: name, type, flags
       4, 0x80000000 | 3, 0x0049590b,
       6, 0x80000000 | 3, 0x0049590b,
       8, 0x80000000 | 3, 0x0049590b,

 // properties: notify_signal_id
       0,
       1,
       2,

       0        // eod
};

void PiracerSomeIPManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<PiracerSomeIPManager *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->batteryChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 1: _t->gearChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 2: _t->modeChanged((*reinterpret_cast< uint8_t(*)>(_a[1]))); break;
        case 3: _t->modeSelectCall((*reinterpret_cast< const quint8(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (PiracerSomeIPManager::*)(uint8_t );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&PiracerSomeIPManager::batteryChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (PiracerSomeIPManager::*)(uint8_t );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&PiracerSomeIPManager::gearChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (PiracerSomeIPManager::*)(uint8_t );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&PiracerSomeIPManager::modeChanged)) {
                *result = 2;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<PiracerSomeIPManager *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< uint8_t*>(_v) = _t->battery(); break;
        case 1: *reinterpret_cast< uint8_t*>(_v) = _t->gear(); break;
        case 2: *reinterpret_cast< uint8_t*>(_v) = _t->mode(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<PiracerSomeIPManager *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setBattery(*reinterpret_cast< uint8_t*>(_v)); break;
        case 1: _t->setGear(*reinterpret_cast< uint8_t*>(_v)); break;
        case 2: _t->setMode(*reinterpret_cast< uint8_t*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject PiracerSomeIPManager::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_PiracerSomeIPManager.data,
    qt_meta_data_PiracerSomeIPManager,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *PiracerSomeIPManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *PiracerSomeIPManager::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_PiracerSomeIPManager.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int PiracerSomeIPManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void PiracerSomeIPManager::batteryChanged(uint8_t _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void PiracerSomeIPManager::gearChanged(uint8_t _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void PiracerSomeIPManager::modeChanged(uint8_t _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
