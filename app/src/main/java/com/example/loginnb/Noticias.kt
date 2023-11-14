package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentNoticiasBinding
import com.example.loginnb.databinding.HomeBinding


class Noticias : Fragment() {

    private var _binding: FragmentNoticiasBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(

        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        _binding = FragmentNoticiasBinding.inflate(inflater, container, false)
        val root: View = binding.root

      binding.backToTheHome.setOnClickListener{
          findNavController().navigate(R.id.action_noticias_to_home)
      }

        binding.nextNotice.setOnClickListener{
            findNavController().navigate(R.id.action_noticias_to_noticias1)
        }

        binding.lastNotice.setOnClickListener{
            findNavController().navigate(R.id.action_noticias_to_noticias2)
        }

        return root
    }



}