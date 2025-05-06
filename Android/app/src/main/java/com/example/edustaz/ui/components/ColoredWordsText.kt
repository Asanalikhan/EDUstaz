package com.example.edustaz.ui.components

import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun ColoredWordsText() {
    val fullText = "Мақала жариялап аттестацияға жарамды тегін СЕРТИФИКАТ АЛЫҢЫЗ!"
    val words = fullText.split(" ")

    val normalText = words.dropLast(3).joinToString(" ") + " "
    val coloredText = words.takeLast(3).joinToString(" ")

    val annotatedText = buildAnnotatedString {
        append(normalText)
        addStyle(
            style = SpanStyle(
                color = Color.Black,
                fontSize = 17.sp,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium
            ),
            start = 0,
            end = normalText.length
        )

        append(coloredText)
        addStyle(
            style = SpanStyle(
                color = Color(0xFF4CAF50),
                fontSize = 17.sp,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium
            ),
            start = normalText.length,
            end = (normalText + coloredText).length
        )
    }

    Text(
        text = annotatedText,
        modifier = Modifier
            .padding(17.dp, 15.dp)
    )
}
