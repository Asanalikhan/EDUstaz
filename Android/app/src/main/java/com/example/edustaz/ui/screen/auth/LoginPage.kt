package com.example.edustaz.ui.screen.auth

import android.util.Log
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.data.model.LoginRequest
import com.example.edustaz.data.remote.NetworkResponse
import com.example.edustaz.data.remote.PreferencesManager
import com.example.edustaz.ui.components.Button
import com.example.edustaz.ui.components.EmailTextField
import com.example.edustaz.ui.components.PasswordTextField
import com.example.edustaz.ui.components.RememberMeCheckBox
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun LoginPage(
    onNavigateToRegister: () -> Unit,
    onNavigateToReset: () -> Unit,
    onNavigateToLogin: () -> Unit,
    viewModel: AuthViewModel
) {
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    val loginResponse = viewModel.loginResponse.observeAsState()

    var isLoading by remember { mutableStateOf(false) }
    var errorMessage by remember { mutableStateOf("") }

    Column(
        Modifier
            .fillMaxSize()
            .padding(20.dp, 0.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {

        Text(
            "Кіру",
            style = MaterialTheme.typography.titleLarge.copy(
                color = Color.Black,
            )
        )
        Spacer(modifier = Modifier.padding(0.dp, 32.dp))
        Text(
            "Почта",
            style = MaterialTheme.typography.labelSmall,
            modifier = Modifier.align(Alignment.Start)
        )
        EmailTextField(email = email, onEmailChange = { email = it })
        Spacer(modifier = Modifier.padding(0.dp, 5.dp))
        Text(
            "Құпия сөз",
            style = MaterialTheme.typography.labelSmall,
            modifier = Modifier.align(Alignment.Start)
        )
        PasswordTextField(password = password, onPasswordChange = { password = it })
        Spacer(modifier = Modifier.padding(0.dp, 8.dp))
        RememberMeCheckBox(modifier = Modifier)
        Spacer(modifier = Modifier.padding(0.dp, 71.dp))
        Button(onClick = {
            isLoading = true
            viewModel.login(LoginRequest(email, password))
            onNavigateToLogin()
        }, text = "Кіру")
        if (isLoading) {
            CircularProgressIndicator(modifier = Modifier.padding(top = 16.dp))
        }
        if (errorMessage.isNotEmpty()) {
            Text(
                text = errorMessage,
                color = Color.Red,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.SemiBold,
                fontSize = 16.sp
            )
        }
        Spacer(modifier = Modifier.padding(0.dp, 16.dp))
        Text(
            "Тіркелмегенсізбе?",
            style = MaterialTheme.typography.labelSmall,
            color = Color.Gray,
            modifier = Modifier.clickable { onNavigateToRegister() }
        )
        Spacer(modifier = Modifier.padding(0.dp, 16.dp))
        Text(
            "Құпия сөзді ұмыттыңызба?",
            style = MaterialTheme.typography.labelSmall,
            color = Color.Gray,
            modifier = Modifier.clickable { onNavigateToReset() }
        )

        when (val value = loginResponse.value) {
            is NetworkResponse.Success -> {
                if (isLoading) {
                    isLoading = false
                    errorMessage = ""
                    val sharedPreferences = PreferencesManager(context = LocalContext.current)
                    sharedPreferences.saveString("user_token", value.data.access)
                    onNavigateToLogin()
                    Log.d("LoginPage", "Login Successful")
                }
            }

            is NetworkResponse.Error -> {
                isLoading = false
                errorMessage = value.message
                Log.d("LoginPage", "Error: ${value.message}")
            }

            NetworkResponse.Loading -> {
                errorMessage = ""
                Log.d("LoginPage", "Loading!")
            }

            null -> {}
        }

    }
}


