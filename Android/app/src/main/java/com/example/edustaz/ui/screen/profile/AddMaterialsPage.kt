package com.example.edustaz.ui.screen.profile

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.navigation.NavController
import com.example.edustaz.data.remote.PreferencesManager
import com.example.edustaz.ui.components.UploadMaterialScreen
import com.example.edustaz.ui.navigation.BottomNavBar
import com.example.edustaz.ui.navigation.TopAppBar

@Composable
fun AddMaterialsPage(
    title: String,
    navController: NavController,
    viewModel: ProfileViewModel
) {

    val sharedPreferences = PreferencesManager(context = LocalContext.current)
    val token = sharedPreferences.getString("user_token")

    LaunchedEffect(Unit) {
        viewModel.getProfileData(token)
    }

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
                onItemClick = { navController.navigate(it.route) }
            )
        }
    ) { values ->
        Box(
            modifier = Modifier
                .padding(values)
                .background(Color(0xFFF5F5F5))
        ) {
            UploadMaterialScreen(
                onItemClick = {},
                onBackClick = { navController.popBackStack() }
            )
        }
    }
}