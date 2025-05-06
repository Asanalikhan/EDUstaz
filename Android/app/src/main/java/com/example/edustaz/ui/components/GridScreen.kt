package com.example.edustaz.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
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
fun GridScreen() {
    val titles =
        listOf("Аттестатицяға дайындық", "Курстар", "Материалдар", "Олимпиада") // Example items
    val images = listOf(
        R.drawable.ic_atestat,
        R.drawable.ic_course,
        R.drawable.ic_materials,
        R.drawable.ic_olympiad
    )

    LazyVerticalGrid(
        columns = GridCells.Fixed(2),
        modifier = Modifier
            .fillMaxWidth()
            .padding(18.dp)
    ) {
        items(titles.zip(images)) { (title, icon) ->
            GridItem(iconRes = icon, text = title)
        }
    }
}

@Composable
private fun GridItem(iconRes: Int, text: String) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .height(75.dp)
            .padding(8.dp),
        shape = RoundedCornerShape(5.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxSize()
                .background(Color.White)
                .padding(10.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                painter = painterResource(id = iconRes),
                contentDescription = "Icon",
                modifier = Modifier.size(25.dp)
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                text = text,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 14.sp,
                modifier = Modifier.fillMaxWidth(),
                textAlign = TextAlign.Center,
            )
        }
    }
}
