//
// Created by feng on 20-3-28.
//


#ifndef MEDIALEARN_AUDIOFRAME_H
#define MEDIALEARN_AUDIOFRAME_H
class AudioFrame{
    float position;
    short samples[9];
    int channel;
    int sampleRate;
    int formata;
};
#endif //MEDIALEARN_AUDIOFRAME_H