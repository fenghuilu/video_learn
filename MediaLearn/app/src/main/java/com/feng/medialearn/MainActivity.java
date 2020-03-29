package com.feng.medialearn;
import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Example of a call to a native method
        TextView tv = findViewById(R.id.sample_text);
//        tv.setText(LameUtils.getInstance().getLameVersion());
        tv.setText(FengPlayer.getInstance().getFFmpegConfig());
//        tv.setText(FFplayer.getInstance().getFFmpegConfig());

    }

}
