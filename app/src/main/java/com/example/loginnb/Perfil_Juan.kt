package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentPerfilJuanBinding


class Perfil_Juan : Fragment() {

    private var _binding: FragmentPerfilJuanBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        _binding = FragmentPerfilJuanBinding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_perfil_Juan_to_search)
        }

        binding.btPersonas.setOnClickListener {
            findNavController().navigate(R.id.action_perfil_Juan_to_search)
        }

        binding.btLugares.setOnClickListener {
            findNavController().navigate(R.id.action_perfil_Juan_to_searchLugares)
        }

        binding.btGrupos.setOnClickListener {
            findNavController().navigate(R.id.action_perfil_Juan_to_searchGrupos)

        }

        // Inflate the layout for this fragment
        return root
    }


}