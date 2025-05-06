package com.example.edustaz.ui.screen.auth

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import com.example.edustaz.ui.components.Button
import com.example.edustaz.ui.components.EmailTextField
import com.example.edustaz.ui.components.PasswordTextField

@Composable
fun RegistrationPage(
    onNavigateToLogin: () -> Unit,
) {
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var confirmPassword by remember { mutableStateOf("") }

    Column(
        Modifier
            .fillMaxSize()
            .padding(20.dp, 0.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            "Тіркелу",
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

        Spacer(modifier = Modifier.padding(0.dp, 5.dp))
        Text(
            "Құпия сөзді растау",
            style = MaterialTheme.typography.labelSmall,
            modifier = Modifier.align(Alignment.Start)
        )
        PasswordTextField(password = confirmPassword, onPasswordChange = { confirmPassword = it })

        Spacer(modifier = Modifier.padding(0.dp, 24.dp))
        Button(onClick = {
            onNavigateToLogin()
        }, text = "Тіркелу")

        Spacer(modifier = Modifier.padding(0.dp, 16.dp))
        Text(
            "Тіркелгенсіз бе? Кіру",
            style = MaterialTheme.typography.labelSmall,
            color = Color.Gray
        )
    }
}
