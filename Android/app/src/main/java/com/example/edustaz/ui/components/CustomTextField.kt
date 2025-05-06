package com.example.edustaz.ui.components

import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextFieldDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

@Composable
fun CustomTextField(value: String, onValueChange: (String) -> Unit) {
    OutlinedTextField(
        value = value,
        onValueChange = onValueChange,
        label = { Text("Қатысушы аты-жөнін сақтаңыз") },
        modifier = Modifier
            .fillMaxWidth()
            .padding(20.dp),
        singleLine = true,
        shape = RoundedCornerShape(10.dp),
        colors = TextFieldDefaults.colors(
            focusedTextColor = Color.Black,
            unfocusedTextColor = Color(0xFF818181),
            focusedLabelColor = Color.Blue,
            unfocusedLabelColor = Color(0xFF818181),
            focusedContainerColor = Color(0xFFF5F5F5),
            unfocusedContainerColor = Color(0xFFF5F5F5),
            focusedIndicatorColor = Color.Transparent,
            unfocusedIndicatorColor = Color.Transparent,
            disabledIndicatorColor = Color.Transparent
        ),
    )
}



