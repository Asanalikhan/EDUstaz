package com.example.edustaz.ui.navigation

import androidx.compose.material3.CenterAlignedTopAppBar
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import androidx.navigation.compose.currentBackStackEntryAsState
import com.example.edustaz.R
import com.example.edustaz.ui.components.TopAppBarIcon
import com.example.edustaz.ui.theme.MontserratFont

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TopAppBar(
    title: String,
    navController: NavController
) {
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentRoute = navBackStackEntry?.destination?.route

    CenterAlignedTopAppBar(
        title = {
            Text(
                text = title,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.SemiBold,
                fontSize = 22.sp,
                style = TextStyle(textAlign = TextAlign.Center)
            )
        },
        navigationIcon = {
            TopAppBarIcon(
                navController = navController,
                route = "profile",
                isSelected = currentRoute == "profile",
                drawable = R.drawable.frame_12645
            )
        },
        actions = {
            TopAppBarIcon(
                navController = navController,
                route = "notification",
                isSelected = currentRoute == "notification",
                drawable = R.drawable.mi_notification
            )
        },
        colors = TopAppBarDefaults.centerAlignedTopAppBarColors(containerColor = Color.White)
    )
}