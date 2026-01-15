package com.example.caculater;
import android.os.Bundle;
import android.text.InputFilter;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.caculater.R;

public class MainActivity extends AppCompatActivity implements View.OnClickListener
{

    //创建Button对象   也就是activity_main.xml里所设置的ID
    Button btn_0,btn_1,btn_2,btn_3,btn_4,btn_5,btn_6,btn_7,btn_8,btn_9,btn_pt;
    Button btn_mul,btn_div,btn_add,btn_sub,btn_per;
    Button btn_clr,btn_del,btn_eq;
    Button btn_MC,btn_Mp,btn_Md,btn_MR;

    EditText et_input;
    EditText et_output;


    private String str = "";//定义全局变量
    private String str_for_cal = "";


    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //实例化对象
        setContentView(R.layout.activity_main);
        btn_MC= (Button)findViewById(R.id.btn_MC);
        btn_Mp= (Button)findViewById(R.id.btn_Mp);
        btn_Md= (Button)findViewById(R.id.btn_Md);
        btn_MR= (Button)findViewById(R.id.btn_MR);

        btn_0= (Button) findViewById(R.id.btn_0);
        btn_1= (Button) findViewById(R.id.btn_1);
        btn_2= (Button) findViewById(R.id.btn_2);
        btn_3= (Button) findViewById(R.id.btn_3);
        btn_4= (Button) findViewById(R.id.btn_4);
        btn_5= (Button) findViewById(R.id.btn_5);
        btn_6= (Button) findViewById(R.id.btn_6);
        btn_7= (Button) findViewById(R.id.btn_7);
        btn_8= (Button) findViewById(R.id.btn_8);
        btn_9= (Button) findViewById(R.id.btn_9);

        btn_pt= (Button) findViewById(R.id.btn_pt);
        btn_add= (Button) findViewById(R.id.btn_add);
        btn_sub= (Button) findViewById(R.id.btn_sub);
        btn_mul= (Button) findViewById(R.id.btn_mul);
        btn_div= (Button) findViewById(R.id.btn_div);
        btn_clr= (Button) findViewById(R.id.btn_clr);
        btn_del= (Button) findViewById(R.id.btn_del);
        btn_per= (Button) findViewById(R.id.btn_per);
        btn_eq= (Button) findViewById(R.id.btn_eq);

        et_input= (EditText) findViewById(R.id.et_input);

        et_output=(EditText) findViewById(R.id.et_output);

        //给按钮设置的点击事件

        btn_MC.setOnClickListener(this);
        btn_Md.setOnClickListener(this);
        btn_Mp.setOnClickListener(this);
        btn_MR.setOnClickListener(this);

        btn_0.setOnClickListener(this);
        btn_1.setOnClickListener(this);
        btn_2.setOnClickListener(this);
        btn_3.setOnClickListener(this);
        btn_4.setOnClickListener(this);
        btn_5.setOnClickListener(this);
        btn_6.setOnClickListener(this);
        btn_7.setOnClickListener(this);
        btn_8.setOnClickListener(this);
        btn_9.setOnClickListener(this);

        btn_pt.setOnClickListener(this);
        btn_add.setOnClickListener(this);
        btn_sub.setOnClickListener(this);
        btn_mul.setOnClickListener(this);
        btn_div.setOnClickListener(this);
        btn_clr.setOnClickListener(this);
        btn_del.setOnClickListener(this);
        btn_per.setOnClickListener(this);
        btn_eq.setOnClickListener(this);
    }

    @Override
    public void onClick(View v)
    {
        /*String str=et_input.getText().toString();
        //获取输入框内的文本内容，并且将其转换为字符串str
        重复读取输入框的内容会导致运算只能管一个运算符*/
        switch (v.getId())
        {
            case R.id.btn_0: {
                str += "0";
                char[] letters = str.toCharArray();
                if (letters.length > 1) {
                    if (letters[0] == '0' && letters[1] == '0'&&letters[1] != ' ') {
                        for (int letter = 0; letter < letters.length - 1; letter++) {
                            letters[letter] = letters[letter + 1];
                        }
                        str = String.valueOf(letters).substring(0, letters.length - 1).trim();
                    }
                }
                et_input.setText(str);
            }
            break;

            case   R.id.btn_1:
            {
                str += "1";
                char[] letters = str.toCharArray();
                if (letters.length > 1) {
                    if (letters[0] == '0' && letters[1] != '.'&&letters[1] != ' ') {
                        for (int letter = 0; letter < letters.length - 1; letter++) {
                            letters[letter] = letters[letter + 1];
                        }
                        str = String.valueOf(letters).substring(0, letters.length - 1).trim();
                    }
                }
                et_input.setText(str);
            }
            break;

            case   R.id.btn_2:
            {
                str += "2";
                char[] letters = str.toCharArray();
                if (letters.length > 1) {
                    if (letters[0] == '0' && letters[1] != '.'&&letters[1] != ' ') {
                        for (int letter = 0; letter < letters.length - 1; letter++) {
                            letters[letter] = letters[letter + 1];
                        }
                        str = String.valueOf(letters).substring(0, letters.length - 1).trim();
                    }
                }
                et_input.setText(str);
            }
            break;

            case   R.id.btn_3:
            {
                str += "3";
                char[] letters = str.toCharArray();
                if (letters.length > 1) {
                    if (letters[0] == '0' && letters[1] != '.'&&letters[1] != ' ') {
                        for (int letter = 0; letter < letters.length - 1; letter++) {
                            letters[letter] = letters[letter + 1];
                        }
                        str = String.valueOf(letters).substring(0, letters.length - 1).trim();
                    }
                }
                et_input.setText(str);
            }
            break;

            case   R.id.btn_4:
            {
                str += "4";
                char[] letters = str.toCharArray();
                if (letters.length > 1) {
                    if (letters[0] == '0' && letters[1] != '.'&&letters[1] != ' ') {
                        for (int letter = 0; letter < letters.length - 1; letter++) {
                            letters[letter] = letters[letter + 1];
                        }
                        str = String.valueOf(letters).substring(0, letters.length - 1).trim();
                    }
                }
                et_input.setText(str);
            }
            break;

            case   R.id.btn_5:
            {
                str += "5";
                char[] letters = str.toCharArray();
                if (letters.length > 1) {
                    if (letters[0] == '0' && letters[1] != '.'&&letters[1] != ' ') {
                        for (int letter = 0; letter < letters.length - 1; letter++) {
                            letters[letter] = letters[letter + 1];
                        }
                        str = String.valueOf(letters).substring(0, letters.length - 1).trim();
                    }
                }
                et_input.setText(str);
            }
            break;

            case   R.id.btn_6:
            {
                str += "6";
                char[] letters = str.toCharArray();
                if (letters.length > 1) {
                    if (letters[0] == '0' && letters[1] != '.'&&letters[1] != ' ') {
                        for (int letter = 0; letter < letters.length - 1; letter++) {
                            letters[letter] = letters[letter + 1];
                        }
                        str = String.valueOf(letters).substring(0, letters.length - 1).trim();
                    }
                }
                et_input.setText(str);
            }
            break;

            case   R.id.btn_7:
            {
                str += "7";
                char[] letters = str.toCharArray();
                if (letters.length > 1) {
                    if (letters[0] == '0' && letters[1] != '.'&&letters[1] != ' ') {
                        for (int letter = 0; letter < letters.length - 1; letter++) {
                            letters[letter] = letters[letter + 1];
                        }
                        str = String.valueOf(letters).substring(0, letters.length - 1).trim();
                    }
                }
                et_input.setText(str);
            }
            break;

            case   R.id.btn_8:
            {
                str += "8";
                char[] letters = str.toCharArray();
                if (letters.length > 1) {
                    if (letters[0] == '0' && letters[1] != '.'&&letters[1] != ' ') {
                        for (int letter = 0; letter < letters.length - 1; letter++) {
                            letters[letter] = letters[letter + 1];
                        }
                        str = String.valueOf(letters).substring(0, letters.length - 1).trim();
                    }
                }
                et_input.setText(str);
            }
            break;

            case   R.id.btn_9:
            {
                str += "9";
                char[] letters = str.toCharArray();
                if (letters.length > 1) {
                    if (letters[0] == '0' && letters[1] != '.' && letters[1] != ' ') {
                        for (int letter = 0; letter < letters.length - 1; letter++) {
                            letters[letter] = letters[letter + 1];
                        }
                        str = String.valueOf(letters).substring(0, letters.length - 1).trim();
                    }
                }
                et_input.setText(str);
            }
            break;


            case R.id.btn_pt://小数点
                if (str.length() == 0) {
                    break;
                } else {
                    str += ".";
                    et_input.setText(str);
                }

            case R.id.btn_add://加法
            {
                if (str_for_cal.length() != 0 && str.length() == 0){
                    str = str_for_cal;
                }
                if (str.length() == 0) {
                       et_input.setText("0 + ");
                   str = "0 + ";
                    break;
                }
                if (str.contains(" ")) {
                    if (str.indexOf(" ") == str.length() - 3)
                        break;
                    getResult();
                }

                str += " + ";
                et_input.setText(str);
            }
            break;

            case R.id.btn_sub://减法
            {
                if (str_for_cal.length() != 0 && str.length() == 0){
                    str = str_for_cal;
                }
                if (str.length() == 0) {
                       et_input.setText("0 - ");
                    str = "0 - ";
                    break;
                }
                if (str.contains(" ")) {
                    if (str.indexOf(" ") == str.length() - 3)
                        break;
                    getResult();
                }

                str += " - ";
                et_input.setText(str);
            }
            break;
            case R.id.btn_mul://乘法
            {
                if (str_for_cal.length() != 0 && str.length() == 0){
                    str = str_for_cal;
                }
                if (str.length() == 0) {
                       et_input.setText("0 × ");
                    str = "0 × ";
                    break;
                }
                if (str.contains(" ")) {
                    if (str.indexOf(" ") == str.length() - 3)
                        break;
                    getResult();
                }

                str += " × ";
                et_input.setText(str);
            }
            break;
            case R.id.btn_div://除法
            {
                if (str_for_cal.length() != 0 && str.length() == 0){
                    str = str_for_cal;
                }
                if (str.length() == 0) {
                       et_input.setText("0 ÷ ");
                    str = "0 ÷ ";
                    break;
                }
                if (str.contains(" ")) {
                    if (str.indexOf(" ") == str.length() - 3)
                        break;
                    getResult();
                }

                str += " ÷ ";
                et_input.setText(str);
            }
            break;
            case R.id.btn_per://百分比
            {
                if (str_for_cal.length() != 0 && str.length() == 0){
                    str = str_for_cal;
                }
                if (str.length() == 0) {
                       et_input.setText("0 % ");
                    str = "0 % ";
                    break;
                }
                if (str.contains(" ")) {
                    if (str.indexOf(" ") == str.length() - 3)
                        break;
                    getResult();
                }

                str += " % ";
                et_input.setText(str);
            }
            break;



            case R.id.btn_clr: {
                str ="";
                str_for_cal="";

                et_input.setText("");
                et_output.setText("");
            }
                break;

            case R.id.btn_MC: {
                str ="";
                str_for_cal="";

                et_input.setText("");
                et_output.setText("");
            }
            break;

            case R.id.btn_del: //判断是否为空，然后在进行删除
            {
                if (str.contains(" ")){
                    if (str.indexOf(" ") == str.length() - 3) {
                        str = str.substring(0, str.length() - 3);
                        et_input.setText(str);
                        break;
                    }
                }

                str = str.substring(0, str.length() - 1);
                et_input.setText(str);
                break;
            }

            case R.id.btn_eq: //单独运算最后结果
                getResult();//调用下面的方法

                str_for_cal = str;
                str ="";
                break;

        }
    }

    private void getResult()
    {


        //获取输入框的文本内容，传递给字符串exp
        if(str==null||str.equals("")) return ;
        //因为没有运算符所以不用运算

        if(!str.contains(" "))//输入框不包含运算符，则直接返回
        {
            return ;
        }

        //截取运算符前面的字符串:
        String s1=str.substring(0,str.indexOf(" "));
        //截取的运算符，第一个操作数s1

        String op=str.substring(str.indexOf(" ")+1,str.indexOf(" ")+2);
        //截取运算符op

        //截取运算符后面的字符串s2
        String s2=str.substring(str.indexOf(" ")+3);

        double cnt=0;

        if(!s1.equals("")&&!s2.equals(""))
        {
            double d1=Double.parseDouble(s1);
            double d2=Double.parseDouble(s2);

            if(op.equals("+"))
            {
                cnt=d1+d2;
            }

            if(op.equals("-"))
            {
                cnt=d1-d2;
            }

            if(op.equals("×"))
            {
                cnt=d1*d2;
            }

            if(op.equals("÷"))
            {
                if(d2==0) cnt=0;
                else cnt=d1/d2;
            }


            if(!s1.contains(".")&&!s2.contains(".")&&!op.equals("÷"))
            {
                int res = (int) cnt;
                et_output.setText(res+"");
                str = "" + res;
            }
            else {
                str = "" + cnt; //将double类型的cnt转成string类型的数据存储在str中

                et_output.setText(cnt+""); }

                str = str.substring(0,(int)str.length());
        }
        //如果s1不是空    s2是空  就执行下一步
        else if(!s1.equals("")&&s2.equals(""))
        {
            double d1=Double.parseDouble(s1);
            if(op.equals("+"))
            {
                cnt=d1;
            }
            if(op.equals("-"))
            {
                cnt=d1;
            }
            if(op.equals("×"))
            {
                cnt=0;
            }
            if(op.equals("÷"))
            {
                cnt=0;
            }
            if(op.equals("%"))
            {
                cnt=d1/100 ;
            }
            if(!s1.contains(".")&&!op.equals("%")) {
                int res = (int) cnt;
                et_output.setText(res+"");
                str = "" + res;
            }else {
                str = "" + cnt; //将double类型的cnt转成string类型的数据存储在str中
                str = str.substring(0,(int)str.length());
                et_output.setText(cnt+"");}
        }

        else {
            str = "" + cnt; //将double类型的cnt转成string类型的数据存储在str中
            str = str.substring(0,(int)str.length());
            et_output.setText("");
        }
    }
}

