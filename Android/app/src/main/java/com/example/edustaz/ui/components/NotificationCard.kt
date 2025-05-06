package com.example.edustaz.ui.components

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.R
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun NotificationCard(title: String, message: String, time: String) {
    Card(
        modifier = Modifier
            .padding(horizontal = 16.dp, vertical = 8.dp)
            .fillMaxSize(),
        colors = CardDefaults.cardColors(
            containerColor = Color.White
        ),
        shape = RoundedCornerShape(12.dp)
    ) {
        Row(
            modifier = Modifier
                .padding(16.dp)
                .fillMaxWidth()
                .background(Color.White),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Image(
                painter = painterResource(R.drawable.offline_bolt),
                contentDescription = "Notification image",
                modifier = Modifier
                    .size(40.dp)
                    .fillMaxWidth(0.2f)
            )
            Spacer(modifier = Modifier.width(16.dp))
            Column(
                modifier = Modifier
                    .fillMaxWidth(0.8f)
            ) {
                Text(
                    text = title,
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.SemiBold,
                    fontSize = 14.sp,
                    color = Color(0xFF298634),
                )
                Spacer(modifier = Modifier.height(6.dp))
                Text(
                    text = message,
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Normal,
                    fontSize = 10.sp
                )
            }
            Spacer(modifier = Modifier.width(16.dp))
            Text(
                text = time,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Normal,
                fontSize = 12.sp,
                modifier = Modifier.align(Alignment.Top),
            )
        }
    }
}
