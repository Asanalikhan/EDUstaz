package com.example.edustaz.ui.components

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.unit.dp

@Composable
fun BottomWave(
    modifier: Modifier = Modifier,
    color: Color = Color(0xFF6C4EFF)
) {
    Canvas(modifier = modifier
        .fillMaxWidth()
        .height(100.dp)) {
        val width = size.width
        val height = size.height

        val path = Path().apply {
            moveTo(0f, height * 0.3f)
            quadraticBezierTo(
                width * 0.25f, height * 0.0f,
                width * 0.5f, height * 0.3f
            )
            quadraticBezierTo(
                width * 0.75f, height * 0.6f,
                width, height * 0.3f
            )
            lineTo(width, height)
            lineTo(0f, height)
            close()
        }

        drawPath(path = path, color = color)
    }
}
