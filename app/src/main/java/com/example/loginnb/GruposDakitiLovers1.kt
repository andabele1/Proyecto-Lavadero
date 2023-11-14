package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentGruposDakitiLovers1Binding


class GruposDakitiLovers1 : Fragment() {

    private var _binding: FragmentGruposDakitiLovers1Binding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        _binding = FragmentGruposDakitiLovers1Binding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_gruposDakitiLovers1_to_searchGrupos)
        }
        binding.Cancelar.setOnClickListener {
            findNavController().navigate(R.id.action_gruposDakitiLovers1_to_searchGrupos)
        }

        binding.unirse.setOnClickListener {
            findNavController().navigate(R.id.action_gruposDakitiLovers1_to_gruposDakitiLovers2)
        }

        return root

    }


}