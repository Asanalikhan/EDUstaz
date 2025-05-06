package com.example.edustaz.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun TimerBox(value: Int, label: String) {
    Column(
        modifier = Modifier
            .background(Color(0xFF4741E1), shape = RoundedCornerShape(10.dp))
            .size(45.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            "$value",
            fontSize = 12.sp,
            fontFamily = MontserratFont,
            fontWeight = FontWeight.Normal,
            color = Color.White
        )
        Text(
            label,
            fontSize = 10.sp,
            fontFamily = MontserratFont,
            fontWeight = FontWeight.Normal,
            color = Color.White
        )
    }
}