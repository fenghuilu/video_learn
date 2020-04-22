package com.feng.medialearn;

public class FengPlayer {
    static {
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
    public native int openMedia(String filePath);
}
