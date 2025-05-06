package com.example.edustaz.ui.navigation

import androidx.compose.material3.Icon
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.NavigationBarItemDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.compose.currentBackStackEntryAsState
import com.example.edustaz.R
import com.example.edustaz.data.model.BottomNavItem

private val navItems = listOf(
    BottomNavItem("home", "home", R.drawable.ic_home),
    BottomNavItem("materials", "materials", R.drawable.ic_materials),
    BottomNavItem("atestat", "atestat", R.drawable.ic_atestat),
    BottomNavItem("course", "course", R.drawable.ic_course),
    BottomNavItem("olympiad", "olympiad", R.drawable.ic_olympiad)
)

@Composable
fun BottomNavBar(
    navController: NavController,
    onItemClick: (BottomNavItem) -> Unit,
) {
    val backStackEntry = navController.currentBackStackEntryAsState()
    NavigationBar(
        tonalElevation = 5.dp,
        containerColor = Color.White
    ) {
        navItems.forEach { item ->
            val selected = item.route == backStackEntry.value?.destination?.route
            NavigationBarItem(
                selected = selected,
                onClick = { onItemClick(item) },
                icon = {
                    Icon(
                        painter = painterResource(item.icon),
                        contentDescription = item.name,
                    )
                },
                colors = NavigationBarItemDefaults.colors(
                    selectedIconColor = Color(0xFF4741E1),
                    unselectedIconColor = Color.Black,
                    indicatorColor = Color.Transparent
                ),
            )
        }
    }
}