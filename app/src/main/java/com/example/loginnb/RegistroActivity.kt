package com.example.loginnb

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.RadioButton
import android.widget.Toast
import androidx.core.widget.NestedScrollView
import com.example.loginnb.databinding.ActivityRegistroBinding

class RegistroActivity : AppCompatActivity() {
    private lateinit var binding: ActivityRegistroBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityRegistroBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.RegisContinuar.setOnClickListener{
            val intent = Intent(this, Bienvenida::class.java)
            startActivity(intent)
            // Agregar la lógica de autenticación aquí
        }

    }

    fun onRadioButtonClicked(view: View) {
        if (view is RadioButton) {
            // Is the button now checked?
            val checked = view.isChecked

            // Check which radio button was clicked
            when (view.getId()) {
                R.id.Femenino ->
                    if (checked) {

                    }
                R.id.Masculino ->
                    if (checked) {

                    }
                R.id.NoDecirlo ->
                    if (checked) {

                    }
            }
        }
    }
}