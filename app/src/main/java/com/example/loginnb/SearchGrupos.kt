package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentSearchGruposBinding
import com.example.loginnb.databinding.SearchBinding


class SearchGrupos : Fragment() {

    private var _binding: FragmentSearchGruposBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        _binding = FragmentSearchGruposBinding.inflate(inflater, container, false)
        val root: View = binding.root
        // Inflate the layout for this fragment

        binding.btLugares.setOnClickListener{
            findNavController().navigate(R.id.action_searchGrupos_to_searchLugares)
        }

        binding.btPersonas.setOnClickListener{
            findNavController().navigate(R.id.action_searchGrupos_to_search2)
        }

        binding.DAKITILovers.setOnClickListener {
            findNavController().navigate(R.id.action_searchGrupos_to_gruposDakitiLovers)
        }

        binding.PasajeFull.setOnClickListener {
            findNavController().navigate(R.id.action_searchGrupos_to_pasajeFull)
        }

        binding.PaCangri.setOnClickListener {
            findNavController().navigate(R.id.action_searchGrupos_to_gruposPaCangri)
        }

        return root
    }


}