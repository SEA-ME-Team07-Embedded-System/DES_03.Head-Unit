/****************************************************************************
** Meta object code from reading C++ file 'dbusmanager.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../dashboard/src/dbusmanager.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dbusmanager.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_DBusManager_t {
    QByteArrayData data[18];
    char stringdata0[188];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DBusManager_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DBusManager_t qt_meta_stringdata_DBusManager = {
    {
QT_MOC_LITERAL(0, 0, 11), // "DBusManager"
QT_MOC_LITERAL(1, 12, 14), // "batteryChanged"
QT_MOC_LITERAL(2, 27, 0), // ""
QT_MOC_LITERAL(3, 28, 7), // "battery"
QT_MOC_LITERAL(4, 36, 11), // "modeChanged"
QT_MOC_LITERAL(5, 48, 4), // "mode"
QT_MOC_LITERAL(6, 53, 11), // "gearChanged"
QT_MOC_LITERAL(7, 65, 4), // "gear"
QT_MOC_LITERAL(8, 70, 20), // "travelableDisChanged"
QT_MOC_LITERAL(9, 91, 13), // "travelableDis"
QT_MOC_LITERAL(10, 105, 9), // "fetchData"
QT_MOC_LITERAL(11, 115, 10), // "getBattery"
QT_MOC_LITERAL(12, 126, 7), // "getMode"
QT_MOC_LITERAL(13, 134, 7), // "getGear"
QT_MOC_LITERAL(14, 142, 16), // "getTravelableDis"
QT_MOC_LITERAL(15, 159, 11), // "mode_select"
QT_MOC_LITERAL(16, 171, 4), // "data"
QT_MOC_LITERAL(17, 176, 11) // "gear_select"

    },
    "DBusManager\0batteryChanged\0\0battery\0"
    "modeChanged\0mode\0gearChanged\0gear\0"
    "travelableDisChanged\0travelableDis\0"
    "fetchData\0getBattery\0getMode\0getGear\0"
    "getTravelableDis\0mode_select\0data\0"
    "gear_select"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DBusManager[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   69,    2, 0x06 /* Public */,
       4,    1,   72,    2, 0x06 /* Public */,
       6,    1,   75,    2, 0x06 /* Public */,
       8,    1,   78,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
      10,    0,   81,    2, 0x02 /* Public */,
      11,    0,   82,    2, 0x02 /* Public */,
      12,    0,   83,    2, 0x02 /* Public */,
      13,    0,   84,    2, 0x02 /* Public */,
      14,    0,   85,    2, 0x02 /* Public */,
      15,    1,   86,    2, 0x02 /* Public */,
      17,    1,   89,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QReal,    3,
    QMetaType::Void, QMetaType::QReal,    5,
    QMetaType::Void, QMetaType::QReal,    7,
    QMetaType::Void, QMetaType::QReal,    9,

 // methods: parameters
    QMetaType::Void,
    QMetaType::QReal,
    QMetaType::QReal,
    QMetaType::QReal,
    QMetaType::QReal,
    QMetaType::Void, QMetaType::QVariant,   16,
    QMetaType::Void, QMetaType::QVariant,   16,

       0        // eod
};

void DBusManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<DBusManager *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->batteryChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        case 1: _t->modeChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        case 2: _t->gearChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        case 3: _t->travelableDisChanged((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        case 4: _t->fetchData(); break;
        case 5: { qreal _r = _t->getBattery();
            if (_a[0]) *reinterpret_cast< qreal*>(_a[0]) = std::move(_r); }  break;
        case 6: { qreal _r = _t->getMode();
            if (_a[0]) *reinterpret_cast< qreal*>(_a[0]) = std::move(_r); }  break;
        case 7: { qreal _r = _t->getGear();
            if (_a[0]) *reinterpret_cast< qreal*>(_a[0]) = std::move(_r); }  break;
        case 8: { qreal _r = _t->getTravelableDis();
            if (_a[0]) *reinterpret_cast< qreal*>(_a[0]) = std::move(_r); }  break;
        case 9: _t->mode_select((*reinterpret_cast< const QVariant(*)>(_a[1]))); break;
        case 10: _t->gear_select((*reinterpret_cast< const QVariant(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (DBusManager::*)(qreal );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&DBusManager::batteryChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (DBusManager::*)(qreal );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&DBusManager::modeChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (DBusManager::*)(qreal );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&DBusManager::gearChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (DBusManager::*)(qreal );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&DBusManager::travelableDisChanged)) {
                *result = 3;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject DBusManager::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_DBusManager.data,
    qt_meta_data_DBusManager,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *DBusManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DBusManager::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_DBusManager.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int DBusManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 11;
    }
    return _id;
}

// SIGNAL 0
void DBusManager::batteryChanged(qreal _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void DBusManager::modeChanged(qreal _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void DBusManager::gearChanged(qreal _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void DBusManager::travelableDisChanged(qreal _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
