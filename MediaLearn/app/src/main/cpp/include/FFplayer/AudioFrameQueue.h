//
// Created by feng on 20-3-28.
//

#ifndef MEDIALEARN_AUDIOFRAMEQUEUE_H
#define MEDIALEARN_AUDIOFRAMEQUEUE_H


#include "AudioFrame.h"

int AudioFrameSize;
AudioFrame *AudioFrameHead;
void push(AudioFrame *audioFrame);

int pop(AudioFrame *audioFrame);

#endif //MEDIALEARN_AUDIOFRAMEQUEUE_H
