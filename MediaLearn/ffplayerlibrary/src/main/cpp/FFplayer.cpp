//
// Created by feng on 20-3-28.
extern "C"
{
#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libavutil/error.h>
}
#include "FFplayer.h"

const char *getFFmpegConfig() {
    return avcodec_configuration();
}
int openMedia(const char* filePath){
    LOGD("openMedia %s",filePath);
    av_register_all();
    avformat_network_init();
    AVFormatContext *avFormatContext = NULL;
    int res = avformat_open_input(&avFormatContext,filePath,NULL,NULL);
    if(res == 0){
        LOGD("avformat_open_input success duration %lld ,nb_streams %lu",avFormatContext->duration,avFormatContext->nb_streams);
    } else {
        LOGD("avformat_open_input failed %s",av_err2str(res));

    }
    avformat_find_stream_info(avFormatContext,0);
    if(res == 0){
        LOGD("avformat_find_stream_info success duration %" PRId64" ,nb_streams %" PRIu32,avFormatContext->duration,avFormatContext->nb_streams);
    } else {
        LOGD("avformat_find_stream_info failed %s",av_err2str(res));

    }
    avformat_close_input(&avFormatContext);
    return res;
}