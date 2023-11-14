package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentDakitiBinding
import com.example.loginnb.databinding.FragmentPasajeBinding


class pasaje : Fragment() {

    private var _binding: FragmentPasajeBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        _binding = FragmentPasajeBinding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_pasaje_to_home)
        }

        binding.Grupos.setOnClickListener {
            findNavController().navigate(R.id.action_pasaje_to_pasaje_grupos)
        }

        binding.Guardar.setOnClickListener {
            findNavController().navigate(R.id.action_pasaje_to_profile)
        }

        binding.btPersonas.setOnClickListener{
            findNavController().navigate(R.id.action_pasaje_to_search)
        }

        binding.btLugares.setOnClickListener{
            findNavController().navigate(R.id.action_pasaje_to_searchLugares)
        }

        binding.btGrupos.setOnClickListener{
            findNavController().navigate(R.id.action_pasaje_to_searchGrupos)
        }

        return root
    }


}