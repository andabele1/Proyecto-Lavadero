package com.example.loginnb

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.loginnb.databinding.FragmentNoticias1Binding
import com.example.loginnb.databinding.FragmentNoticias2Binding


class Noticias2 : Fragment() {


    private var _binding: FragmentNoticias2Binding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        _binding = FragmentNoticias2Binding.inflate(inflater, container, false)
        val root: View = binding.root

        binding.backToTheHome.setOnClickListener{
            findNavController().navigate(R.id.action_noticias2_to_home)
        }

        binding.nextNotice.setOnClickListener{
            findNavController().navigate(R.id.action_noticias2_to_noticias)
        }

        binding.lastNotice.setOnClickListener{
            findNavController().navigate(R.id.action_noticias2_to_noticias1)
        }

        return root
    }


}