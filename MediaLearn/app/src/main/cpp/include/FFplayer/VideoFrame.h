//
// Created by feng on 20-3-28.
//


#include <jni.h>
#ifndef MEDIALEARN_VIDEOFRAME_H
#define MEDIALEARN_VIDEOFRAME_H
typedef unsigned char byte;

class VideoFrame{
    byte data[9];
    int width,height;
    float postion;
    int format;
};

#endif //MEDIALEARN_VIDEOFRAME_H