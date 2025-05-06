package com.example.edustaz.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.data.model.OlympiadListResponseItem
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun OlympiadGrid(
    onItemClick: (String) -> Unit,
    list: List<OlympiadListResponseItem>,
) {

    LazyVerticalGrid(
        columns = GridCells.Fixed(3),
        modifier = Modifier
            .padding(16.dp)
            .fillMaxWidth()
    ) {
        items(list) { title ->
            GridItem(
                text = title.shortName,
                onClick = { onItemClick(title.shortName) }
            )
        }
    }
}

@Composable
private fun GridItem(text: String, onClick: () -> Unit) {
    Card(
        modifier = Modifier
            .size(110.dp)
            .padding(7.dp)
            .clickable { onClick() },
        shape = RoundedCornerShape(8.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .background(Color.White)
                .padding(6.dp)
        ) {
            Text(
                text = text,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 12.sp,
                textAlign = TextAlign.End,
                modifier = Modifier.fillMaxWidth()
            )
        }
    }
}
