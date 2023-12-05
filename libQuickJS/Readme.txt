# 源代码结构解析
1. quickjs.c/h : 核心代码runtime
    依赖 cutils.h, list.h, libregexp.h, libbf.h(可选)
        部分库再次依赖 libunicode.h
2. quickjs-libc.c/h : std标准库，依赖1
3. qjsc.c : 编译器，可以将js编译为app, 输出js的c code
   qjs.c : 类似nodejs可执行文件, 依赖repl.c 文件(通过qjsc生成)
   qjsbn/qjsbnc : 带有数字扩展的解释器和编译器

DEFINES += CONFIG_BIGNUM

SOURCES += \
        cutils.c \
        libbf.c \
        libregexp.c \
        libunicode.c \
        main.c \
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
