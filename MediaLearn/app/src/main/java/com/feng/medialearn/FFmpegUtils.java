package com.feng.medialearn;

public class FFmpegUtils {
    static {
        System.loadLibrary("ffmpeg_player");
    }
    private static FFmpegUtils mInstance;
    private FFmpegUtils(){}
    public static FFmpegUtils getInstance(){
        if(mInstance == null){
            synchronized (FFmpegUtils.class){
                if(mInstance == null){
                    mInstance = new FFmpegUtils();
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
