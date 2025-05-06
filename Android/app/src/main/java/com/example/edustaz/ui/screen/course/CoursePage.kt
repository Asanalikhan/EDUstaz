package com.example.edustaz.ui.screen.course

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.navigation.NavController
import com.example.edustaz.ui.navigation.TopAppBar
import com.example.edustaz.ui.navigation.BottomNavBar

@Composable
fun CoursePage(
    title: String,
    navController: NavController
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
        Column(
            modifier = Modifier
                .padding(values)
                .fillMaxSize()
                .background(Color(0xFFF5F5F5))
        ) {

        }

    }
}