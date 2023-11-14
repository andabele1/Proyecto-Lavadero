package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentGruposDakitiLovers2Binding
import com.example.loginnb.databinding.FragmentGruposPaCangriBinding


class GruposDakitiLovers2 : Fragment() {

    private var _binding: FragmentGruposDakitiLovers2Binding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentGruposDakitiLovers2Binding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_gruposDakitiLovers2_to_searchGrupos)
        }
        binding.CancelarMorado.setOnClickListener {
            findNavController().navigate(R.id.action_gruposDakitiLovers2_to_searchGrupos)
        }

        binding.UnirseMorado.setOnClickListener {
            findNavController().navigate(R.id.action_gruposDakitiLovers2_to_profile)
        }

        return root

    }
}