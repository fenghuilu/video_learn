package com.feng.medialearn;

public class LameUtils {
//    static {
//        System.loadLibrary("lame");
//    }
    private static LameUtils mInstance;
    private LameUtils(){}
    public static LameUtils getInstance(){
        if(mInstance == null){
            synchronized (LameUtils.class){
                if(mInstance == null){
                    mInstance = new LameUtils();
                }
            }
        }
        return mInstance;
    }
    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    public native String getLameVersion();
}
