package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentTopGruposDakitiBinding
import com.example.loginnb.databinding.FragmentTopGruposPasajeBinding

class Top_Grupos_Pasaje : Fragment() {

    private var _binding: FragmentTopGruposPasajeBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentTopGruposPasajeBinding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_top_Grupos_Pasaje_to_home)
        }

        return root


    }


    }
