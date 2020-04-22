//
// Created by feng on 20-3-28.
//

#ifndef MEDIALEARN_FFPLAYER_H
#define MEDIALEARN_FFPLAYER_H

#include <jni.h>
#include "LogCommon.h"
#define LOG_TAG "FFplayer"

const char *getFFmpegConfig();
int openMedia(const char*);
void start();
void play();
void pause();
void stop();

#endif //MEDIALEARN_FFPLAYER_H
