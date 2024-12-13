package com.example.lab_3;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.second_sc_view), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
    }



    public void main_btn_click(View btn) {

        EditText inputText = findViewById(R.id.userName);
        TextView warn= findViewById(R.id.warning);
        String input_txt = inputText.getText().toString();

        if (TextUtils.isEmpty(inputText.getText().toString())) {

            warn.setText("NAME CAN NOTT BE EMPTY");
            warn.setVisibility(View.VISIBLE);
        } else {
            String textToSend = inputText.getText().toString();
            Intent secondScreen = new Intent(MainActivity.this, second_page.class);
            secondScreen.putExtra("sc1_name",inputText.getText().toString());
            warn.setVisibility(View.GONE);
            startActivity(secondScreen);

        }

    }


}