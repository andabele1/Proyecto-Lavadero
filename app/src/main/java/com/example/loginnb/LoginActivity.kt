package com.example.loginnb


import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

import com.example.loginnb.databinding.ActivityLoginBinding

class LoginActivity : AppCompatActivity() {
    private lateinit var binding: ActivityLoginBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.btnIngresar.setOnClickListener {

            val intent = Intent(this, Bienvenida::class.java)
            startActivity(intent)
            // Agregar la lógica de autenticación aquí
        }

        binding.tvRecuperarContrasena.setOnClickListener {
            val intent = Intent(this, RecuperarContrasenaActivity::class.java)
            startActivity(intent)
        }

        binding.btnCrearCuenta.setOnClickListener {
            // Crear un Intent para iniciar la actividad de registro (cambia "RegistroActivity" al nombre de tu actividad de registro)
            val intent = Intent(this, RegistroActivity::class.java)
            startActivity(intent)
        }


    }
}

