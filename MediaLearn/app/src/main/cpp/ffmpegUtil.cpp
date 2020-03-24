//
// Created by feng on 20-3-24.
//

#include <jni.h>
#include "ffmpegUtil.h"

extern "C" JNIEXPORT jstring
JNICALL
Java_com_feng_medialearn_FFmpegUtils_getFFmpegConfig(JNIEnv *env, jobject thiz) {
    return env->NewStringUTF(avcodec_configuration());
}