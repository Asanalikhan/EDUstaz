package com.example.edustaz.ui.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun OlympiadCard(
    icon: Int,
    title: String,
    description: String
) {
    Row(
        modifier = Modifier
            .padding(8.dp, 0.dp)
            .height(70.dp)
    ) {
        Icon(
            painter = painterResource(icon),
            contentDescription = "Icon",
            modifier = Modifier.padding(20.dp)
        )
        Column(
            verticalArrangement = Arrangement.SpaceEvenly,
            modifier = Modifier.fillMaxHeight()
        ) {
            Text(
                text = title,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 13.sp
            )
            Text(
                text = description,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 13.sp
            )
        }
    }
}