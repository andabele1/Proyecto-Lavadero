package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentGruposDakitiLoversBinding
import com.example.loginnb.databinding.FragmentSearchGruposBinding


class GruposDakitiLovers : Fragment() {

    private var _binding: FragmentGruposDakitiLoversBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        _binding = FragmentGruposDakitiLoversBinding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_gruposDakitiLovers_to_searchGrupos)
        }
        binding.Cancelar.setOnClickListener {
            findNavController().navigate(R.id.action_gruposDakitiLovers_to_searchGrupos)
        }

        binding.UbicacionGrupos.setOnClickListener {
            findNavController().navigate(R.id.action_gruposDakitiLovers_to_gruposDakitiLovers1)
        }


        // Inflate the layout for this fragment
        return root
    }


}