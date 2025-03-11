set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR riscv64)
set(C906 True)

if(DEFINED ENV{RISCV_ROOT_PATH})
    file(TO_CMAKE_PATH $ENV{RISCV_ROOT_PATH} RISCV_ROOT_PATH)
else()
    message(FATAL_ERROR "RISCV_ROOT_PATH env must be defined")
endif()

set(RISCV_ROOT_PATH ${RISCV_ROOT_PATH} CACHE STRING "root path to riscv toolchain")

set(CMAKE_C_COMPILER "${RISCV_ROOT_PATH}/bin/riscv64-unknown-linux-gnu-gcc")
set(CMAKE_CXX_COMPILER "${RISCV_ROOT_PATH}/bin/riscv64-unknown-linux-gnu-g++")

set(CMAKE_FIND_ROOT_PATH "${RISCV_ROOT_PATH}/riscv64-unknown-linux-gnu")

set(CMAKE_SYSROOT "${RISCV_ROOT_PATH}/sysroot")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_C_FLAGS "-march=rv64gcv0p7_zfh_xtheadc -mabi=lp64d -mtune=c906")
set(CMAKE_CXX_FLAGS "-march=rv64gcv0p7_zfh_xtheadc -mabi=lp64d -mtune=c906")

# cache flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "c flags")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" CACHE STRING "c++ flags")

# export RISCV_ROOT_PATH=/home/nihui/osd/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.6.1

# cmake -DCMAKE_TOOLCHAIN_FILE=../../toolchains/c906-v261.toolchain.cmake -DCMAKE_C_FLAGS="-fno-rtti -fno-exceptions" -DCMAKE_CXX_FLAGS="-fno-rtti -fno-exceptions" -DCMAKE_INSTALL_PREFIX=install -DCMAKE_BUILD_TYPE=Release `cat ../../opencv4_cmake_options.txt` -DBUILD_opencv_world=OFF -DOPENCV_DISABLE_FILESYSTEM_SUPPORT=ON ..

# /home/nihui/osd/xuantie-qemu-x86_64-Ubuntu-18.04-20230825-0120/bin/qemu-riscv64 -cpu c906fdv -L /home/nihui/osd/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.6.1/sysroot ./opencv-mobile-test
