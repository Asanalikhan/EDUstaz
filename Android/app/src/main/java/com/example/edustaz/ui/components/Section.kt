package com.example.edustaz.ui.components

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.R
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun Section(
    image: Int,
    title: String,
    onClick: () -> Unit
) {
    Row(
        horizontalArrangement = Arrangement.Absolute.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier
            .clickable { onClick() }
            .fillMaxWidth()
            .padding(48.dp, 20.dp)
    ) {
        Icon(
            painter = painterResource(image),
            contentDescription = "Icon"
        )
        Text(
            text = title,
            fontFamily = MontserratFont,
            fontWeight = FontWeight.Medium,
            fontSize = 15.sp
        )
        Icon(
            painter = painterResource(R.drawable.baseline_keyboard_arrow_right_24),
            contentDescription = "Right"
        )
    }
}