package com.example.edustaz.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun CustomInputField(
    placeholder: String,
    value: String,
    onValueChange: (String) -> Unit,
    modifier: Modifier = Modifier.fillMaxWidth(),
    singleLine: Boolean = true,
) {
    OutlinedTextField(
        value = value,
        onValueChange = onValueChange,
        placeholder = {
            Text(
                fontWeight = FontWeight.Normal,
                fontFamily = MontserratFont,
                fontSize = 12.sp,
                text = placeholder,
                color = Color.Gray
            )
        },
        modifier = modifier
            .background(Color(0xFFF0F4FF), RoundedCornerShape(8.dp)),
        singleLine = singleLine,
        colors = OutlinedTextFieldDefaults.colors(
            unfocusedBorderColor = Color.Transparent,
            focusedBorderColor = Color.Transparent,
            disabledBorderColor = Color.Transparent,
            cursorColor = Color.Black,
            focusedLabelColor = Color.Gray,
            unfocusedLabelColor = Color.Gray
        ),
        shape = RoundedCornerShape(8.dp)
    )
}
