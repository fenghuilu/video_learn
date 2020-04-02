//
// Created by feng on 20-3-29.
//
#include "FengPlayer.h"
extern "C" JNIEXPORT jstring
JNICALL
Java_com_feng_medialearn_FengPlayer_getFFmpegConfig(JNIEnv *env, jobject thiz) {
    return env->NewStringUTF(getFFmpegConfig());
}