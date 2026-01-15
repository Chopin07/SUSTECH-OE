package com.example.week7;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.graphics.Color;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;

import java.util.Timer;

public class MainActivity extends AppCompatActivity{
    private zhushiFragment zhushiFragment = new zhushiFragment();//声明Fragment
    private chaocaiFragment chaocaiFragment = new chaocaiFragment();
    private malatFragment malatFragment=new malatFragment();
    private qingzhencaiFragment qingzhencaiFragment=new qingzhencaiFragment();
    private Button btn_zhushi,btn_chaocai,btn_mlt,btn_qzc;



    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        getSupportFragmentManager().beginTransaction().add(R.id.ll_detail,zhushiFragment).commitAllowingStateLoss();//绑定Fragment
        btn_zhushi = findViewById(R.id.btnzhushi);
        btn_chaocai = findViewById(R.id.btnchaocai);
        btn_mlt= findViewById(R.id.btnmalat);
        btn_qzc= findViewById(R.id.btnqingzhencai);

        OnClick onClick = new OnClick();
        btn_zhushi.setOnClickListener(onClick);
        btn_chaocai.setOnClickListener(onClick);
        btn_mlt. setOnClickListener(onClick);
        btn_qzc.setOnClickListener(onClick);

        btn_zhushi.performClick();//自动点击


    }




    private class OnClick implements View.OnClickListener{
        @Override
        public void onClick(View view) {
            if(view.getId()==R.id.btnzhushi){
                btn_zhushi.setBackgroundColor(getResources().getColor(R.color.white));
                btn_chaocai.setBackgroundColor(getResources().getColor(R.color.oringin));
                btn_mlt.setBackgroundColor(getResources().getColor(R.color.oringin));
                btn_qzc. setBackgroundColor(getResources().getColor(R.color.oringin));
                getSupportFragmentManager().beginTransaction().replace(R.id.ll_detail,zhushiFragment).commitAllowingStateLoss();
            }
            else if(view.getId()==R.id.btnchaocai){
                btn_zhushi.setBackgroundColor(getResources().getColor(R.color.oringin));
                btn_chaocai.setBackgroundColor(getResources().getColor(R.color.white));
                btn_mlt.setBackgroundColor(getResources().getColor(R.color.oringin));
                btn_qzc. setBackgroundColor(getResources().getColor(R.color.oringin));
                getSupportFragmentManager().beginTransaction().replace(R.id.ll_detail,chaocaiFragment).commitAllowingStateLoss();
            }
            else if(view.getId()==R.id.btnmalat){
                btn_zhushi.setBackgroundColor(getResources().getColor(R.color.oringin));
                btn_chaocai.setBackgroundColor(getResources().getColor(R.color.oringin));
                btn_mlt.setBackgroundColor(getResources().getColor(R.color.white));
                btn_qzc. setBackgroundColor(getResources().getColor(R.color.oringin));
                getSupportFragmentManager().beginTransaction().replace(R.id.ll_detail,malatFragment).commitAllowingStateLoss();

            }
            else if(view.getId()==R.id.btnqingzhencai){
                btn_zhushi.setBackgroundColor(getResources().getColor(R.color.oringin));
                btn_chaocai.setBackgroundColor(getResources().getColor(R.color.oringin));
                btn_mlt.setBackgroundColor(getResources().getColor(R.color.oringin));
                btn_qzc. setBackgroundColor(getResources().getColor(R.color.white));
                getSupportFragmentManager().beginTransaction().replace(R.id.ll_detail,qingzhencaiFragment).commitAllowingStateLoss();

            }
        }
    }
}