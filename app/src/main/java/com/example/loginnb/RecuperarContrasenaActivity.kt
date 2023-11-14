package com.example.loginnb

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.loginnb.databinding.ActivityRecuperarContrasenaBinding

class RecuperarContrasenaActivity : AppCompatActivity() {
    private lateinit var binding: ActivityRecuperarContrasenaBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityRecuperarContrasenaBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Configurar el OnClickListener del botón "Enviar"
        binding.btnEnviar.setOnClickListener {
            // Agregar la lógica para enviar el correo y recuperar la contraseña
            // ...

            // Una vez que se haya completado el proceso, regresar a LoginActivity
            val intent = Intent(this, LoginActivity::class.java)
            startActivity(intent)
        }

        // Configurar el OnClickListener del texto "Login"
        binding.tvLogin.setOnClickListener {
            // Cuando se hace clic en "Login", regresar a LoginActivity
            val intent = Intent(this, LoginActivity::class.java)
            startActivity(intent)
        }
    }
}