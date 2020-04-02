//
// Created by feng on 20-3-28.
//

#ifndef MEDIALEARN_FFPLAYER_H
#define MEDIALEARN_FFPLAYER_H

#include <jni.h>
#include "AudioOutput.h"
#include "VideoOutput.h"
#include "AVSynchronizer.h"
#include "VideoFrame.h"
#include "AudioFrame.h"
extern "C"
{
#include "libavcodec/avcodec.h"
}
AudioOutput *audioOutput;
VideoOutput *videoOutput;
AVSynchronizer *avSynchronizer;

const char *getFFmpegConfig();
void start();
void play();
void pause();
void stop();
VideoFrame getCurrentVideoFrame();
AudioFrame getCurrentAudioFrame();
#endif //MEDIALEARN_FFPLAYER_H
