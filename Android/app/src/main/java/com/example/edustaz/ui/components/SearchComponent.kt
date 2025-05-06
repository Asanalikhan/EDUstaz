package com.example.edustaz.ui.components

import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.Icon
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextFieldDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun SearchComponent(
    query: String,
    onQueryChanged: (String) -> Unit,
) {
    OutlinedTextField(
        value = query,
        onValueChange = onQueryChanged,
        leadingIcon = {
            Icon(
                imageVector = Icons.Default.Search,
                contentDescription = "Search"
            )
        },
        placeholder = {
            Text(
                text = "Іздеген тақырыпты еңгізіңіз",
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 15.sp,
                style = TextStyle(color = Color.Gray, fontSize = 14.sp)
            )
        },
        modifier = Modifier
            .fillMaxWidth()
            .padding(top = 15.dp),
        shape = RoundedCornerShape(0.dp),
        singleLine = true,
        colors = TextFieldDefaults.colors(
            focusedContainerColor = Color.White,
            unfocusedContainerColor = Color.White,
            focusedIndicatorColor = Color.Transparent,
            unfocusedIndicatorColor = Color.Transparent,
            cursorColor = Color.Black,
            focusedLabelColor = Color.Gray,
            unfocusedLabelColor = Color.LightGray,
            disabledLabelColor = Color.LightGray,
            focusedTextColor = Color.Black,
            unfocusedTextColor = Color.Black
        )

    )
}
