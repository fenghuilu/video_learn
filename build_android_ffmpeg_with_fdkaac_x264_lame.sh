#!/bin/bash
# 清空上次的编译
make clean
#你自己的NDK路径.
export NDK=/home/feng/Android/Sdk/ndk/20.0.5594570

TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64

SYSROOT=$TOOLCHAIN/sysroot

#目标android版本
ANDROID_API=29
export CFLAGS="-D__ANDROID_API__=$ANDROID_API"
export CXXFLAGS="-D__ANDROID_API__=$ANDROID_API"

FDK_AAC_PATH=/home/feng/MediaLearnDir/fdk-aac-2.0.0/android/armv7-a
LAME_PATH=/home/feng/MediaLearnDir/lame-3.100/android/armv7-a
X264_PATH=/home/feng/MediaLearnDir/x264/android/armv7-a

function build_android
{
echo "Compiling FFmpeg for $CPU"
./configure \
--disable-shared \
--enable-static \
--disable-stripping \
--enable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-avdevice \
--disable-devices \
--disable-indevs \
--disable-outdevs \
--disable-debug \
--disable-x86asm \
--disable-doc \
--enable-small \
--enable-dct \
--enable-dwt \
--enable-lsp \
--enable-mdct \
--enable-rdft \
--enable-fft \
--enable-version3 \
--enable-nonfree \
--disable-filters \
--disable-postproc \
--disable-bsfs \
--enable-bsf=aac_adtstoasc \
--enable-bsf=h264_mp4toannexb \
--disable-encoders \
--enable-encoder=pcm_s16le \
--enable-encoder=aac \
--enable-encoder=libvo_aacenc \
--disable-decoders \
--enable-decoder=aac \
--enable-decoder=mp3 \
--enable-decoder=pcm_s16le \
--disable-parsers \
--enable-parser=aac \
--disable-muxers \
--enable-muxer=flv \
--enable-muxer=wav \
--enable-muxer=adts \
--disable-demuxers \
--enable-demuxer=flv \
--enable-demuxer=wav \
--enable-demuxer=aac \
--disable-protocols \
--enable-protocol=rtmp \
--enable-protocol=file \
--enable-gpl \
--enable-encoder=libfdk_aac \
--enable-libfdk_aac \
--enable-muxer=h264 \
--enable-encoder=libx264 \
--enable-libx264 \
--enable-muxer=mp3 \
--enable-encoder=libmp3lame \
--enable-libmp3lame \
--extra-cflags="-I$LAME_PATH/include -I$X264_PATH/include -I$FDK_AAC_PATH/include" \
--extra-ldflags="-L$LAME_PATH/lib -L$X264_PATH/lib -L$FDK_AAC_PATH/lib" \
--cross-prefix=$CROSS_PREFIX \
--cc=${ANDROID_CROSS_PREFIX}-clang \
--target-os=android \
--arch=$ARCH \
--cpu=$CPU \
--enable-cross-compile \
--sysroot=$SYSROOT \
--prefix=$PREFIX \
$ADDITIONAL_CONFIGURE_FLAG

make clean
make -j8
make install
echo "The Compilation of FFmpeg for $CPU is completed"
}

#armv8-a
#ARCH=arm64
#CPU=armv8-a
#CROSS_PREFIX=$TOOLCHAIN/bin/aarch64-linux-android-
#ANDROID_CROSS_PREFIX=$TOOLCHAIN/bin/aarch64-linux-android$ANDROID_API
#PREFIX=$(pwd)/android/$CPU
#build_android

#armv7-a
ARCH=arm
CPU=armv7-a
CROSS_PREFIX=$TOOLCHAIN/bin/arm-linux-androideabi-
ANDROID_CROSS_PREFIX=$TOOLCHAIN/bin/armv7a-linux-androideabi$ANDROID_API
PREFIX=$(pwd)/android/$CPU
build_android

#x86
#ARCH=x86
#CPU=x86
#CROSS_PREFIX=$TOOLCHAIN/bin/i686-linux-android-
#ANDROID_CROSS_PREFIX=$TOOLCHAIN/bin/i686-linux-android$ANDROID_API
#PREFIX=$(pwd)/android/$CPU
#build_android

#x86_64
#ARCH=x86_64
#CPU=x86-64
#CROSS_PREFIX=$TOOLCHAIN/bin/x86_64-linux-android-
#ANDROID_CROSS_PREFIX=$TOOLCHAIN/bin/x86_64-linux-android$ANDROID_API
#PREFIX=$(pwd)/android/$CPU
#build_android

