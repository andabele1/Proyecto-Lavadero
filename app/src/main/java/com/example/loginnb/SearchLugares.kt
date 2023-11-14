package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentSearchLugaresBinding


class SearchLugares : Fragment() {

    private var _binding: FragmentSearchLugaresBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        _binding = FragmentSearchLugaresBinding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.btPersonas.setOnClickListener{
            findNavController().navigate(R.id.action_searchLugares_to_search3)
        }

        binding.btGrupos.setOnClickListener{
            findNavController().navigate(R.id.action_searchLugares_to_searchGrupos)
        }

        binding.imageView5.setOnClickListener {
            findNavController().navigate(R.id.action_searchLugares_to_map)
        }

        binding.imageView6.setOnClickListener {
            findNavController().navigate(R.id.action_searchLugares_to_map)
        }

        binding.cangriImage.setOnClickListener {
            findNavController().navigate(R.id.action_searchLugares_to_map)
        }
        return root
    }


}