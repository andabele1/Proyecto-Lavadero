package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentTopGruposDakitiBinding
import com.example.loginnb.databinding.HomeBinding

class Top_Grupos_Dakiti : Fragment() {

    private var _binding: FragmentTopGruposDakitiBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        // Inflate the layout for this fragment
        _binding = FragmentTopGruposDakitiBinding.inflate(inflater, container, false)
        val root: View = binding.root


        binding.backToTheHome.setOnClickListener{
            findNavController().navigate(R.id.action_top_Grupos_Dakiti_to_home)
        }

        return root

    }


    }
