//
// Created by feng on 20-3-29.
//

#include "FengPlayer.h"

extern "C" JNIEXPORT jstring
JNICALL
Java_com_feng_medialearn_FengPlayer_getFFmpegConfig(JNIEnv *env, jobject thiz) {
    return env->NewStringUTF(getFFmpegConfig());
}
extern "C"
JNIEXPORT jint JNICALL
Java_com_feng_medialearn_FengPlayer_openMedia(JNIEnv *env, jobject thiz, jstring file_path) {
    const char* url = env->GetStringUTFChars(file_path,0);
    env->ReleaseStringUTFChars(file_path,url);
    return openMedia(url);
}
