package com.example.loginnb.ui.notifications

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.fragment.findNavController
import com.example.loginnb.R
import com.example.loginnb.databinding.SearchBinding

class NotificationsFragment : Fragment() {

    private var _binding: SearchBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val notificationsViewModel =
            ViewModelProvider(this).get(NotificationsViewModel::class.java)

        _binding = SearchBinding.inflate(inflater, container, false)
        val root: View = binding.root


        binding.btLugares.setOnClickListener{
            findNavController().navigate(R.id.action_search_to_searchLugares)
        }

        binding.btGrupos.setOnClickListener{
            findNavController().navigate(R.id.action_search_to_searchGrupos)
        }

        binding.PerfilHenry.setOnClickListener {
            findNavController().navigate(R.id.action_search_to_perfil_Henry)
        }

        binding.PerfilJuan.setOnClickListener {
            findNavController().navigate(R.id.action_search_to_perfil_Juan)
        }

        return root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}