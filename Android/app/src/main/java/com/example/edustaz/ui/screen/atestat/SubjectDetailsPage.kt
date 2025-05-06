package com.example.edustaz.ui.screen.atestat

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.R
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun SubjectDetailsPage(
    subject: String,
    onBack: () -> Unit,
    onStartTest: () -> Unit,
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.White)
            .padding(16.dp)
    ) {
        // Top Row with Back and Title
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier.fillMaxWidth()
        ) {
            Icon(
                imageVector = Icons.AutoMirrored.Filled.ArrowBack,
                contentDescription = "Back",
                modifier = Modifier
                    .padding(end = 8.dp)
                    .clickable { onBack() }
            )
            Text(
                text = "$subject пәнінен Толық ППБ форматына сай тест",
                fontSize = 16.sp,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                textAlign = TextAlign.Center
            )
        }

        Spacer(modifier = Modifier.height(32.dp))

        // Row with subject and participant icons
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(30.dp, 0.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
        ) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Icon(
                    painter = painterResource(id = R.drawable.ic_course), // replace with real icon
                    contentDescription = null,
                    tint = Color.Black,
                    modifier = Modifier.align(Alignment.Start)
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = "Тест Пәні:\n$subject",
                    fontSize = 14.sp,
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Medium
                )
            }

            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Icon(
                    painter = painterResource(id = R.drawable.frame_12645), // replace with real icon
                    contentDescription = null,
                    tint = Color.Black,
                    modifier = Modifier.align(Alignment.Start)
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = "Қатысушы:\nҰстаз",
                    fontSize = 14.sp,
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Medium
                )
            }
        }

        Spacer(modifier = Modifier.height(24.dp))

        Text(
            text = "50 сұрақтан тұратын нағыз ПББ форматына сай тест тапсыр",
            fontSize = 13.sp,
            fontWeight = FontWeight.Medium,
            fontFamily = MontserratFont,
            modifier = Modifier.padding(30.dp, 0.dp)
        )

        Spacer(modifier = Modifier.height(16.dp))

        Text(
            text = "Аттестацияда (ПББ) келетін тақырыптар бойынша жасалған тесттермен дайындалып, бізбен бірге тестілеуден оңай өтесіз",
            color = Color(0xFF3BA935),
            fontSize = 13.sp,
            fontFamily = MontserratFont,
            fontWeight = FontWeight.Medium,
            modifier = Modifier.padding(30.dp, 0.dp)
        )

        Spacer(modifier = Modifier.weight(1f))

        Button(
            onClick = {
                onStartTest()
            },
            modifier = Modifier
                .fillMaxWidth()
                .height(48.dp),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF4A35EF)),
            shape = RoundedCornerShape(12.dp)
        ) {
            Text(
                text = "Тестті тапсыру",
                color = Color.White,
                fontSize = 16.sp,
                fontFamily = MontserratFont
            )
        }
    }
}
