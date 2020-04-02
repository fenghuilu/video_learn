//
// Created by feng on 20-3-28.
//

#include "FFplayer/FFplayer.h"

const char *getFFmpegConfig() {
    return avcodec_configuration();
}
void init(){
//    avcodec_register_all();
}