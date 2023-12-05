# QuickJS APP

参考 https://github.com/quickjs-zh/QuickJS 项目makefile，自己做的基于qmake 和 MinGW32 工具链的项目模板。

- libQuickJS 项目生成动态链接库
- qjsc 原项目的js编译器(可执行文件功能仅支持linux)
- App 代码修改qjs,合并了repl.js代码。实际使用时可替换为自己的app。

Qt Version: 5.12.5 MinGW32

=========================

Cmake project 需自行测试

=========================

2023/12/05  
BBDXF

# 测试脚本
```javascript
// global test
print("start cmd: "+scriptArgs)

// std,os test
console.log("ENV OS: "+std.getenv('OS'))
print("Platform: "+os.platform)

// script test
print("script return val: "+std.evalScript("function a(){ return 'abc'; } \r\n a()"))

// file test
var tmpf = std.tmpfile()
tmpf.puts("hello world")
print(tmpf.tell())
tmpf.close()

var f1 = std.open("./f1.txt", "w+")
f1.puts("abc123\r\n=====真棒")
print(f1.tell())
f1.close()

// function
function str2ab(str) {
  var buf = new ArrayBuffer(str.length); // 2 bytes for each char
  var bufView = new Uint8Array(buf);
  for (var i=0, strLen=str.length; i<strLen; i++) {
    bufView[i] = str.charCodeAt(i);
  }
  return buf;
}

function strToUtf8Bytes(text) {
  const code = encodeURIComponent(text)
  const bytes = []
  for (let i = 0;i < code.length;i++) {
    const c = code.charAt(i)
    if (c === '%') {
      const hex = code.charAt(i + 1) + code.charAt(i + 2)
      const hexval = parseInt(hex, 16)
      bytes.push(hexval)
      i += 2
    } else {
      bytes.push(c.charCodeAt(0))
    }
  }
  return bytes
}
print(strToUtf8Bytes("aaa哈哈"))

// file 2
var f2 = os.open("./f2.txt", os.O_CREAT|os.O_RDWR)
print(f2)
var txt = str2ab("123456")
print(new Uint8Array(txt))
print(os.write(f2, txt, 0, 5))

os.close(f2)

print("exit!")
```