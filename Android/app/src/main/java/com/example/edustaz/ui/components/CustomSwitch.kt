package com.example.edustaz.ui.components

import androidx.compose.animation.animateContentSize
import androidx.compose.animation.core.FastOutSlowInEasing
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun CustomSwitch(
    selectedOption: String,
    onOptionSelected: (String) -> Unit
) {
    val options = listOf("Ұстаздар", "Оқушылар")
    val selectedIndex = options.indexOf(selectedOption)
    val screenWidth = LocalConfiguration.current.screenWidthDp.dp
    val density = LocalDensity.current
    val screenWidthPx = with(density) { screenWidth.toPx() }
    val offsetValue = with(density) { (screenWidthPx / 2).toDp() }
    val animatedOffset by animateDpAsState(
        targetValue = if (selectedIndex == 0) 0.dp else offsetValue,
        animationSpec = tween(durationMillis = 300, easing = FastOutSlowInEasing)
    )

    Box(
        modifier = Modifier
            .height(50.dp)
            .background(Color(0xFFE5E5E5))
            .padding(3.dp)
    ) {
        Box(
            modifier = Modifier
                .fillMaxHeight()
                .fillMaxWidth(0.5f)
                .offset(x = animatedOffset)
                .clip(RoundedCornerShape(15.dp))
                .background(Color.White)
                .animateContentSize()
        )

        Row(
            modifier = Modifier
                .fillMaxSize(),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            val interactionSource = remember { MutableInteractionSource() }
            options.forEach { option ->
                Text(
                    text = option,
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Medium,
                    fontSize = 16.sp,
                    modifier = Modifier
                        .clickable(
                            indication = null,
                            interactionSource = interactionSource
                        ) {
                            onOptionSelected(option)
                        }
                        .padding(11.dp)
                )
            }
        }
    }
}