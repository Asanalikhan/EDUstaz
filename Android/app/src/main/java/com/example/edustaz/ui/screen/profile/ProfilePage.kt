package com.example.edustaz.ui.screen.profile

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
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
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.example.edustaz.R
import com.example.edustaz.data.remote.NetworkResponse
import com.example.edustaz.data.remote.PreferencesManager
import com.example.edustaz.ui.components.BottomWave
import com.example.edustaz.ui.components.Section
import com.example.edustaz.ui.navigation.BottomNavBar
import com.example.edustaz.ui.navigation.TopAppBar
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun ProfilePage(
    title: String,
    navController: NavController,
    viewModel: ProfileViewModel
) {
    val sharedPreferences = PreferencesManager(context = LocalContext.current)
    val token = sharedPreferences.getString("user_token")
    val response = viewModel.profileResponse.observeAsState()

    var email by remember { mutableStateOf("") }
    var firstName by remember { mutableStateOf("") }
    var lastName by remember { mutableStateOf("") }
    var profileForm by remember { mutableStateOf(true) }

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
                .fillMaxSize()
        ) {

            when (val result = response.value) {
                is NetworkResponse.Success -> {
                    val profileData = result.data
                    email = profileData.email
                    firstName = profileData.firstName
                    lastName = profileData.lastName
                }

                is NetworkResponse.Error -> {}
                NetworkResponse.Loading -> {}
                null -> {}
            }

            if (profileForm) {
                Column(
                    modifier = Modifier
                        .padding(9.dp)
                        .background(Color.White)
                        .fillMaxSize(),
                ) {
                    Image(
                        modifier = Modifier
                            .padding(top = 37.dp, start = 10.dp)
                            .align(Alignment.CenterHorizontally)
                            .clickable { profileForm = false },
                        painter = painterResource(R.drawable.img_profile),
                        contentDescription = "Profile",
                    )
                    Text(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(top = 5.dp),
                        text = email,
                        fontFamily = MontserratFont,
                        fontWeight = FontWeight.Medium,
                        fontSize = 11.sp,
                        textAlign = TextAlign.Center
                    )

                    Spacer(modifier = Modifier.height(40.dp))
                    Section(R.drawable.ic_materials, "Материалдарым", onClick = {
                        navController.navigate("addMaterials")
                    })
                    Section(R.drawable.ic_course, "Курстарым", onClick = {})
                    Section(R.drawable.ic_olympiad, "Олимпиадаларым", onClick = {})
                    Section(R.drawable.mi_notification, "Шығу", onClick = {})

                    Column(
                        modifier = Modifier.fillMaxSize(),
                        verticalArrangement = Arrangement.Bottom
                    ) {
                        BottomWave()
                    }
                }
            } else {
                Box(
                    modifier = Modifier
                        .padding(9.dp)
                        .fillMaxSize()
                ) {
                    UserProfileForm(
                        onClick = { profileForm = true },
                        viewModel = viewModel,
                        firstName = firstName,
                        lastName = lastName,
                        token = token
                    )
                }
            }

        }
    }
}
