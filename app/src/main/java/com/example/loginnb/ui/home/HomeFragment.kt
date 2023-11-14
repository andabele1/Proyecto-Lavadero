package com.example.loginnb.ui.home

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.fragment.app.findFragment
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.fragment.findNavController
import com.example.loginnb.MainNavigation
import com.example.loginnb.R
import com.example.loginnb.databinding.HomeBinding

class HomeFragment : Fragment(R.layout.home) {

    private var _binding: HomeBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val homeViewModel =
            ViewModelProvider(this).get(HomeViewModel::class.java)

        _binding = HomeBinding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.NOTICIAS.setOnClickListener{
            findNavController().navigate(R.id.action_home_to_noticias)
        }

        binding.TGPasaje.setOnClickListener{
            findNavController().navigate(R.id.action_home_to_top_Grupos_Dakiti)
        }

        binding.TGDakiti.setOnClickListener {
            findNavController().navigate(R.id.action_home_to_top_Grupos_Pasaje)
        }

        binding.TGCangri.setOnClickListener {
            findNavController().navigate(R.id.action_home_to_top_Grupos_Cangri)
        }

        binding.DAKITI.setOnClickListener {
            findNavController().navigate(R.id.action_home_to_dakiti)
        }

        binding.PASAJE.setOnClickListener {
            findNavController().navigate(R.id.action_home_to_pasaje)
        }

        binding.CANGRI.setOnClickListener {
            findNavController().navigate(R.id.action_home_to_cangri)
        }

        return root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}