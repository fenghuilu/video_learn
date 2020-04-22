package com.feng.medialearn;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

import androidx.lifecycle.Transformations;

import com.feng.medialearn.databinding.ActivityMainBinding;

import java.io.File;

public class MainActivity extends Activity {
    ActivityMainBinding mainBinding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mainBinding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(mainBinding.getRoot());
        getExternalCacheDir().getAbsolutePath();
        Log.d("feng","getExternalCacheDir "+getExternalCacheDir().getAbsolutePath());
//        tv.setText(FengPlayer.getInstance().getFFmpegConfig());
        int res = FengPlayer.getInstance().openMedia(getExternalCacheDir().getAbsolutePath()+ File.separator+"test.mp4");
        Log.d("feng","openMedia  res "+res);
        mainBinding.sampleText.setText(res+"");
    }

}
