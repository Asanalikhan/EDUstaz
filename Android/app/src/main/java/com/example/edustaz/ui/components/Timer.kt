package com.example.edustaz.ui.components

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.R
import com.example.edustaz.data.model.TimeRemaining
import com.example.edustaz.ui.theme.MontserratFont
import kotlinx.coroutines.delay
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

@Composable
fun Timer() {

    val targetDate =
        SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.getDefault()).parse("2025-04-10 12:00")
    var remainingTime by remember { mutableStateOf(getTimeRemaining(targetDate)) }

    LaunchedEffect(remainingTime) {
        delay(1000)
        remainingTime = getTimeRemaining(targetDate)
    }
    Card(
        shape = RoundedCornerShape(20.dp),
        modifier = Modifier
            .fillMaxWidth()
            .padding(22.dp, 0.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .background(Color.White)
                .padding(27.dp, 19.dp)
        ) {
            Text(
                text = "Наурыз айының зияткерлік олимпиадасы",
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 14.sp,
                color = Color.Green
            )

            Text(
                text = "Олимпиаданың бітуіне қалды:",
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Normal,
                fontSize = 12.sp,
                color = Color.Black,
            )

            Row(
                verticalAlignment = Alignment.CenterVertically,
            ) {
                TimerBox(remainingTime.days, "Күн")
                Spacer(modifier = Modifier.width(6.dp))
                TimerBox(remainingTime.hours, "Сағат")
                Spacer(modifier = Modifier.width(6.dp))
                TimerBox(remainingTime.minutes, "Минут")
                Spacer(modifier = Modifier.width(6.dp))
                TimerBox(remainingTime.second, "Секунд")
                Spacer(modifier = Modifier.width(25.dp))
                Image(
                    painter = painterResource(id = R.drawable.img_rocket),
                    contentDescription = "Rocket",
                    modifier = Modifier.size(70.dp)
                )

            }
        }
    }
}

fun getTimeRemaining(targetDate: Date?): TimeRemaining {
    if (targetDate == null) return TimeRemaining(0, 0, 0, 0)

    val currentTime = System.currentTimeMillis()
    val difference = targetDate.time - currentTime

    val days = (difference / (1000 * 60 * 60 * 24)).toInt()
    val hours = ((difference / (1000 * 60 * 60)) % 24).toInt()
    val minutes = ((difference / (1000 * 60)) % 60).toInt()
    val seconds = ((difference / 1000 % 60)).toInt()

    return TimeRemaining(days, hours, minutes, seconds)
}
