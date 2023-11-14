package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentDakitiBinding
import com.example.loginnb.databinding.FragmentTopGruposPasajeBinding
import com.google.android.material.bottomnavigation.BottomNavigationView

class dakiti : Fragment() {

    private var _binding: FragmentDakitiBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        _binding = FragmentDakitiBinding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_dakiti_to_home)
        }

        binding.btPersonas.setOnClickListener{
            findNavController().navigate(R.id.action_dakiti_to_search)
        }

        binding.Guardar.setOnClickListener {
            findNavController().navigate(R.id.action_dakiti_to_profile)
        }

        binding.btLugares.setOnClickListener{
            findNavController().navigate(R.id.action_dakiti_to_searchLugares)
        }

        binding.btGrupos.setOnClickListener{
            findNavController().navigate(R.id.action_dakiti_to_searchGrupos)
        }

        binding.Grupos.setOnClickListener {
            findNavController().navigate(R.id.action_dakiti_to_dakiti_grupos)
        }

        return root
    }

}


