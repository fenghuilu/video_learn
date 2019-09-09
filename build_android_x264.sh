#!/bin/bash
# 清空上次的编译
make clean
#你自己的NDK路径.
export NDK_ROOT=/home/feng/Android/Sdk/ndk/20.0.5594570

TOOLCHAIN=$NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64

SYSROOT=$TOOLCHAIN/sysroot

#export PATH=$PATH:$TOOLCHAIN/bin:

#目标android版本
ANDROID_API_VERSION=29
export CFLAGS="-D__ANDROID_API__=$ANDROID_API_VERSION"
export CXXFLAGS="-D__ANDROID_API__=$ANDROID_API_VERSION"

export CPPFLAGS="$CFLAGS"
export CFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="$LDFLAGS"

#交叉编译工具指定
function export_toolchain
{
#clang compile
export AS=$ANDROID_CROSS_PREFIX-clang
export CC=$ANDROID_CROSS_PREFIX-clang
export CXX=$ANDROID_CROSS_PREFIX-clang++

PREFIX=$(pwd)/android/$CPU
CROSS_PREFIX=$TOOLCHAIN/bin/$TARGET_HOST-
}

function build_android
{
echo "Compiling x264 for $CPU"
./configure \
--disable-asm \
--prefix=$PREFIX \
--enable-static \
--enable-pic \
--enable-strip \
--disable-cli \
--extra-cflags=$CFLAGS \
--host=$TARGET_HOST \
--cross-prefix=$CROSS_PREFIX \
--sysroot=$SYSROOT
make clean
make -j8
make install
echo "The Compilation of x264 for $CPU is completed"
}
#armv8-a
#ARCH=arm64
#CPU=armv8-a
#TARGET_HOST=aarch64-linux-android
#ANDROID_CROSS_PREFIX=$TOOLCHAIN/bin/aarch64-linux-android$ANDROID_API_VERSION
#export_toolchain
#build_android

#armv7-a
ARCH=arm
CPU=armv7-a
TARGET_HOST=arm-linux-androideabi
ANDROID_CROSS_PREFIX=$TOOLCHAIN/bin/armv7a-linux-androideabi$ANDROID_API_VERSION
export_toolchain
build_android

#x86
#ARCH=x86
#CPU=x86
#TARGET_HOST=i686-linux-android
#ANDROID_CROSS_PREFIX=$TOOLCHAIN/bin/i686-linux-android$ANDROID_API_VERSION
#export_toolchain
#build_android

#x86_64
#ARCH=x86_64
#CPU=x86-64
#TARGET_HOST=x86_64-linux-android
#ANDROID_CROSS_PREFIX=$TOOLCHAIN/bin/x86_64-linux-android$ANDROID_API_VERSION
#export_toolchain
#build_android

