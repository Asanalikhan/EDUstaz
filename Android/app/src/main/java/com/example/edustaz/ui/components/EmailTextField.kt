package com.example.edustaz.ui.components

import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.KeyboardType

@Composable
fun EmailTextField(email: String, onEmailChange: (String) -> Unit, modifier: Modifier = Modifier) {
    OutlinedTextField(
        value = email,
        onValueChange = onEmailChange,
        label = { Text("Почтаңызды еңгізіңіз") },
        singleLine = true,
        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Email),
        modifier = modifier.fillMaxWidth()
    )
}
