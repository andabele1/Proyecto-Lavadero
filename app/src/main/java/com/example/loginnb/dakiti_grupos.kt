package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentCangriBinding
import com.example.loginnb.databinding.FragmentDakitiGruposBinding

class dakiti_grupos : Fragment() {

    private var _binding: FragmentDakitiGruposBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        _binding = FragmentDakitiGruposBinding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_dakiti_grupos_to_dakiti)
        }

        binding.btPersonas.setOnClickListener{
            findNavController().navigate(R.id.action_dakiti_grupos_to_search)
        }

        binding.btLugares.setOnClickListener{
            findNavController().navigate(R.id.action_dakiti_grupos_to_searchLugares)
        }

        binding.btGrupos.setOnClickListener{
            findNavController().navigate(R.id.action_dakiti_grupos_to_searchGrupos)
        }


        return root
    }


}