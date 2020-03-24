//
// Created by feng on 19-9-2.
//

#include <jni.h>
#include "SimpleLame.h"

extern "C"

JNIEXPORT jstring JNICALL
Java_com_feng_medialearn_LameUtils_getLameVersion(JNIEnv *env, jobject thiz) {
    return env->NewStringUTF(get_lame_version());
}