package com.feng.medialearn;

public class FFplayer {
    static {
//        System.loadLibrary("avutil");
//        System.loadLibrary("avcodec");
//        System.loadLibrary("avformat");
//        System.loadLibrary("swscale");
//        System.loadLibrary("swresample");
//        System.loadLibrary("avfilter");
        System.loadLibrary("FFplayer");
    }
    private static FFplayer mInstance;
    private FFplayer(){}
    public static FFplayer getInstance(){
        if(mInstance == null){
            synchronized (FFplayer.class){
                if(mInstance == null){
                    mInstance = new FFplayer();
                }
            }
        }
        return mInstance;
    }
    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    public native String getFFmpegConfig();
}
