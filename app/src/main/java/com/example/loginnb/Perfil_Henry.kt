package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentPerfilHenryBinding


class Perfil_Henry : Fragment() {

    private var _binding: FragmentPerfilHenryBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        _binding = FragmentPerfilHenryBinding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_perfil_Henry_to_search)
        }

        binding.btPersonas.setOnClickListener {
            findNavController().navigate(R.id.action_perfil_Henry_to_search)
        }

        binding.btLugares.setOnClickListener {
            findNavController().navigate(R.id.action_perfil_Henry_to_searchLugares)
        }

        binding.btGrupos.setOnClickListener {
            findNavController().navigate(R.id.action_perfil_Henry_to_searchGrupos)

        }

        return root
    }
}