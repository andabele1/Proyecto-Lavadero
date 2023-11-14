package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentCangriBinding


class cangri : Fragment() {

    private var _binding: FragmentCangriBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        _binding = FragmentCangriBinding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener {
            findNavController().navigate(R.id.action_cangri_to_home)
        }

        binding.Grupos.setOnClickListener {
            findNavController().navigate(R.id.action_cangri_to_cangri_grupos)
        }

        binding.Guardar.setOnClickListener {
            findNavController().navigate(R.id.action_cangri_to_profile)
        }

        binding.btPersonas.setOnClickListener{
            findNavController().navigate(R.id.action_cangri_to_search)
        }

        binding.btLugares.setOnClickListener{
            findNavController().navigate(R.id.action_cangri_to_searchLugares)
        }

        binding.btGrupos.setOnClickListener{
            findNavController().navigate(R.id.action_cangri_to_searchGrupos)
        }

        // Inflate the layout for this fragment
        return root
    }

}