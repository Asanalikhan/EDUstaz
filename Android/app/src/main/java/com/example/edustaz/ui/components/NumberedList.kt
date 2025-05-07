package com.example.edustaz.ui.components

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun NumberedList() {
    val items = listOf(
        "Қатысушының аты-жөнін енгізіңіз (Бірнеше қатысушы болса барлығының аты-жөнін жазыңыз)",
        "Тестті бастау батырмасын басып тест тапсырыңыз (Басқа қолданушыға көмек ретінде тіркесеңіз қатысу кодын беріңіз. Өзі код арқылы тапсыра алады)",
        "Марапатты жүктеп алыңыз (Қатысушы тест біткен соң нәтижесі шыққан беттен өзі жүктеп алуына болады)"
    )

    Text(
        text = "Қатысу нұсқаулығы",
        fontFamily = MontserratFont,
        fontWeight = FontWeight.Medium,
        fontSize = 13.sp,
        color = Color.Green,
        modifier = Modifier.padding(16.dp, 5.dp)
    )

    Column(modifier = Modifier.padding(16.dp, 0.dp)) {
        items.forEachIndexed { index, text ->
            Row {
                Text(
                    text = "${index + 1}. ",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Normal,
                    fontSize = 11.sp
                )
                Text(
                    text = text,
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Normal,
                    fontSize = 11.sp
                )
            }
        }
    }

    BlueButtons(listOf("Қод еңгізу", "Нұсқаулықты жүктеу"))

}
