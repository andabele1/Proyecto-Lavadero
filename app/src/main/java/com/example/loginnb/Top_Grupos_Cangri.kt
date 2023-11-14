package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentTopGruposCangriBinding
import com.example.loginnb.databinding.FragmentTopGruposPasajeBinding


class Top_Grupos_Cangri : Fragment() {

    private var _binding: FragmentTopGruposCangriBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentTopGruposCangriBinding.inflate(inflater, container, false)
        val root: View = binding.root
        // Inflate the layout for this fragment

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_top_Grupos_Cangri_to_home)
        }

        return root
    }


}