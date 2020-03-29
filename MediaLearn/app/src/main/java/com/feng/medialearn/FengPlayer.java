package com.feng.medialearn;

public class FengPlayer {
    static {
//        System.loadLibrary("avutil");
//        System.loadLibrary("avcodec");
//        System.loadLibrary("avformat");
//        System.loadLibrary("swscale");
//        System.loadLibrary("swresample");
//        System.loadLibrary("avfilter");
        System.loadLibrary("FengPlayer");
    }
    private static FengPlayer mInstance;
    private FengPlayer(){}
    public static FengPlayer getInstance(){
        if(mInstance == null){
            synchronized (FengPlayer.class){
                if(mInstance == null){
                    mInstance = new FengPlayer();
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
