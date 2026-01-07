### Introduction

Small project about making an os from scratch


### Dependencies

You need yo make a cross-compiler using the following :

gcc version :

```
Using built-in specs.
COLLECT_GCC=i686-elf-gcc
COLLECT_LTO_WRAPPER=/home/matthieu/opt/cross/libexec/gcc/i686-elf/13.3.0/lto-wrapper
Target: i686-elf
Configured with: ../gcc-13.3.0/configure --target=i686-elf --prefix=/home/matthieu/opt/cross --disable-nls --enable-languages=c,c++ --without-headers --disable-hosted-libstdcxx
Thread model: single
Supported LTO compression algorithms: zlib zstd
gcc version 13.3.0 (GCC) 
```

ld/binutils version :
```
GNU ld (GNU Binutils) 2.42
```

### Run

use makefile (`make`) to build kernel and make iso image or `make run` to run directly into qemu

