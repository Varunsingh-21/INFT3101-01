package com.example.lab_3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class answer_page extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_answer_page);
        Intent intent2=getIntent();
        int result = getIntent().getIntExtra("result",0);
        if(intent2.hasExtra("answers")){
            TextView a_head_l=findViewById(R.id.a_head);
            a_head_l.setVisibility(View.VISIBLE);
            String answers = getIntent().getStringExtra("answers");
            TextView ans_l=findViewById(R.id.a_head);
            String a_display=ans_l.getText()+answers;
            ans_l.setText(a_display);
        }
        TextView rs=findViewById(R.id.num_res);
        rs.setText(String.valueOf(result));
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
    }
    public void quit_pgn(){
        finishAffinity(); // Closes all activities and exits the app
        System.exit(0);

    }
}