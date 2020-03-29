//
// Created by feng on 20-3-28.
//

#ifndef MEDIALEARN_VIDEOFRAMEQUEUE_H
#define MEDIALEARN_VIDEOFRAMEQUEUE_H

#include "VideoFrame.h"

int size;
VideoFrame *head;
void push(VideoFrame *videoFrame);
int pop(VideoFrame *videoFrame);

#endif //MEDIALEARN_VIDEOFRAMEQUEUE_H
