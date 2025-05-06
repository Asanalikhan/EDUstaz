package com.example.edustaz.ui.theme

import androidx.compose.material3.Typography
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import com.example.edustaz.R

val MontserratFont = FontFamily(
    Font(R.font.regular, FontWeight.Normal),
    Font(R.font.medium, FontWeight.Medium),
    Font(R.font.semi_bold, FontWeight.SemiBold),
    Font(R.font.bold, FontWeight.Bold)
)

val Typography = Typography(
    bodyLarge = TextStyle(
        fontFamily = MontserratFont,
        fontWeight = FontWeight.Normal,
        fontSize = 16.sp
    ),
    titleLarge = TextStyle(
        fontFamily = MontserratFont,
        fontWeight = FontWeight.SemiBold,
        fontSize = 28.sp
    ),
    labelSmall = TextStyle(
        fontFamily = MontserratFont,
        fontWeight = FontWeight.Medium,
        fontSize = 16.sp
    ),
    bodySmall = TextStyle(
        fontFamily = MontserratFont,
        fontWeight = FontWeight.Normal,
        fontSize = 14.sp
    ),
    bodyMedium = TextStyle(
        fontSize = 8.sp,
        fontFamily = MontserratFont,
        fontWeight = FontWeight.Medium
    ),
    titleSmall = TextStyle(
        fontFamily = MontserratFont,
        fontWeight = FontWeight.Normal,
        fontSize = 6.sp
    )

)
