package com.example.lab_3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.CheckBox;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class second_page extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_second_page);
        String u_name = getIntent().getStringExtra("sc1_name");
        TextView displayText = findViewById(R.id.p_name);
        displayText.setText(u_name);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.second_sc_view), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });


    }
    public void check_quiz_ans(View btn2) {
        int points=0;
        int rid=2131296782;
        Spinner myspinner= findViewById(R.id.spinner);
        CheckBox mycb1=findViewById(R.id.cb1);
        CheckBox mycb2=findViewById(R.id.cb2);
        CheckBox mycb3=findViewById(R.id.cb3);
        CheckBox mycb4=findViewById(R.id.cb4);
        RadioGroup myrbg=findViewById(R.id.rbg);
        Switch myans=findViewById(R.id.ans);

        String selectedSpin = myspinner.getSelectedItem().toString();
        boolean isChecked1 = mycb1.isChecked();
        boolean isChecked2 = mycb2.isChecked();
        boolean isChecked3 = mycb3.isChecked();
        boolean isChecked4 = mycb4.isChecked();

        boolean sw_val = myans.isChecked();
        if(selectedSpin.equals("Justin Trudeau")){
            points++;
        }
        if(isChecked1 && isChecked3){
            if(!(isChecked2 || isChecked4)){
                points++;
            }
        }
        if(rid==myrbg.getCheckedRadioButtonId()){
            points++;
        }

        String ans_="ANS 1: Justin Trudeau \nANS 2: Ontario, Alberta\nANS 3: 10";
        System.out.println(points);
        Intent thirdScreen = new Intent(second_page.this, answer_page.class);
        if(myans.isChecked()){
            thirdScreen.putExtra("answers",ans_);
        }
        thirdScreen.putExtra("result",points);

        startActivity(thirdScreen);

    }

    public void quit_pgn(){
        finishAffinity(); // Closes all activities and exits the app
        System.exit(0);

    }
}