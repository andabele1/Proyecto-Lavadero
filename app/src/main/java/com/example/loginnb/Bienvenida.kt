package com.example.loginnb

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.loginnb.databinding.ActivityBienvenidaBinding

class Bienvenida : AppCompatActivity() {
    private lateinit var binding: ActivityBienvenidaBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        binding = ActivityBienvenidaBinding.inflate(layoutInflater)
        super.onCreate(savedInstanceState)
        setContentView(binding.root)

        binding.btnContinuar.setOnClickListener{
            val intent = Intent(this, MainNavigation::class.java)
            startActivity(intent)
        }
    }
}