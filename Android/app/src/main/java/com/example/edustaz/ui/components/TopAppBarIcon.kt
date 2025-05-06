package com.example.edustaz.ui.components

import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.IconButtonDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.navigation.NavController

@Composable
fun TopAppBarIcon(
    navController: NavController,
    route: String,
    isSelected: Boolean,
    drawable: Int
) {
    IconButton(
        onClick = { navController.navigate(route) },
        colors = IconButtonDefaults.iconButtonColors(
            contentColor = if (isSelected) Color(0xFF4741E1) else Color.Black
        ),
        modifier = Modifier.fillMaxWidth(0.25f)
    ) {
        Icon(
            painter = painterResource(drawable),
            contentDescription = "Notification"
        )
    }
}
