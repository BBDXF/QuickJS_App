TEMPLATE = lib
#CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

DEFINES += CONFIG_BIGNUM

SOURCES += \
        cutils.c \
        libbf.c \
        libregexp.c \
        libunicode.c \
        quickjs-libc.c \
        quickjs.c

HEADERS += \
    cutils.h \
    libbf.h \
    libregexp-opcode.h \
    libregexp.h \
    libunicode-table.h \
    libunicode.h \
    list.h \
    quickjs-atom.h \
    quickjs-libc.h \
    quickjs-opcode.h \
    quickjs.h
