package com.example.edustaz.ui.screen.olympiad

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.navigation.NavController
import com.example.edustaz.data.remote.NetworkResponse
import com.example.edustaz.data.remote.PreferencesManager
import com.example.edustaz.ui.components.CustomSwitch
import com.example.edustaz.ui.components.OlympiadGrid
import com.example.edustaz.ui.navigation.BottomNavBar
import com.example.edustaz.ui.navigation.TopAppBar

@Composable
fun OlympiadPage(
    title: String,
    navController: NavController,
    viewModel: OlympiadViewModel,
) {
    Scaffold(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.White),
        topBar = {
            TopAppBar(
                title = title,
                navController = navController
            )
        },
        bottomBar = {
            BottomNavBar(
                navController = navController,
                onItemClick = {
                    navController.navigate(it.route)
                }
            )
        }
    ) { values ->

        var selectedType by remember { mutableStateOf("Ұстаздар") }
        var selectedOption by remember { mutableStateOf<String?>(null) }
        val sharedPreferences = PreferencesManager(context = LocalContext.current)
        val token = sharedPreferences.getString("user_token")

        LaunchedEffect(Unit) {
            viewModel.getList(token = token)
        }
        val responseOlympiad = viewModel.olympiadResponse.observeAsState()

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(values)
                .background(Color(0xFFF5F5F5))
        ) {
            CustomSwitch(
                selectedOption = selectedType,
                onOptionSelected = { selectedType = it }
            )

            if (selectedOption == null) {
                when (val response = responseOlympiad.value) {
                    is NetworkResponse.Success -> {
                        val filteredList = response.data.filter {
                            it.category.title == selectedType
                        }
                        OlympiadGrid(
                            onItemClick = { selectedOption = it },
                            list = filteredList,
                        )
                    }

                    is NetworkResponse.Error -> {
                        Box(
                            modifier = Modifier.fillMaxSize(),
                            contentAlignment = Alignment.Center
                        ) {
                            Text(response.message)
                        }
                    }

                    NetworkResponse.Loading -> {
                        Box(
                            modifier = Modifier
                                .fillMaxSize(),
                            contentAlignment = Alignment.Center
                        ) {
                            CircularProgressIndicator()
                        }
                    }

                    null -> {}
                }
            } else {
                OlympiadDetailed(
                    subject = selectedOption!!,
                    type = selectedType == "Ұстаздар",
                    onBack = { selectedOption = null }
                )
            }
        }
    }
}