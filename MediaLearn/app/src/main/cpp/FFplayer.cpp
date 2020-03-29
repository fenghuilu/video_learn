//
// Created by feng on 20-3-28.
//

#include "include/FFplayer/FFplayer.h"

const char *gethahaFFmpegConfig() {
    return avcodec_configuration();
}
void init(){
//    avcodec_register_all();
}
//extern "C" JNIEXPORT jstring
//JNICALL
//Java_com_feng_medialearn_FFplayer_getFFmpegConfig(JNIEnv *env, jobject thiz) {
//    return env->NewStringUTF(avcodec_configuration());
//}