TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

DEFINES += CONFIG_BIGNUM

SOURCES += \
        qjsc.c

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../libQuickJS/release/ -llibQuickJS
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../libQuickJS/debug/ -llibQuickJS
else:unix: LIBS += -L$$OUT_PWD/../libQuickJS/ -llibQuickJS

INCLUDEPATH += $$PWD/../libQuickJS
DEPENDPATH += $$PWD/../libQuickJS
