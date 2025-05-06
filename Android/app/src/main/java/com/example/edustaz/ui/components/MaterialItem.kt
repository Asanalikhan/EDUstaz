package com.example.edustaz.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.data.model.MaterialsResponse
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun MaterialItem(
    item: MaterialsResponse.Result,
    onItemClick: (Int) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .background(Color.White)
            .padding(12.dp)
            .clickable { onItemClick(item.id) }
    ) {
        Text(
            text = item.title,
            fontSize = 15.sp,
            fontWeight = FontWeight.Normal,
            fontFamily = MontserratFont,
            color = Color.Blue
        )
        Spacer(modifier = Modifier.height(8.dp))

        Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
            Text(
                text = item.group.name,
                fontSize = 13.sp,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Light
            )
            Text(
                text = item.className.name,
                fontSize = 13.sp,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Light
            )
            Text(
                text = item.subject.name,
                fontSize = 13.sp,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Light
            )
        }

    }
}