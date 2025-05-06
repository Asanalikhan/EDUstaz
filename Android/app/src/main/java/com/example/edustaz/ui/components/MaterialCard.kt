package com.example.edustaz.ui.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.R
import com.example.edustaz.data.model.MaterialItem
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun MaterialCard(material: MaterialItem) {
    Card(
        modifier = Modifier
            .padding(8.dp)
            .width(170.dp),
        shape = RoundedCornerShape(5.dp),
        colors = CardDefaults.cardColors(containerColor = Color.White),
    ) {
        Column(
            modifier = Modifier.padding(7.dp),
            verticalArrangement = Arrangement.spacedBy(10.dp)
        ) {
            Text(
                text = material.title,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 12.sp,
                color = Color(0xFF4741E1)
            )

            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.Start
            ) {
                Icon(
                    painter = painterResource(R.drawable.frame_12645),
                    contentDescription = "Author",
                    tint = Color.Gray,
                    modifier = Modifier.size(18.dp)
                )
                Spacer(modifier = Modifier.width(6.dp))
                Text(
                    text = material.author,
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Normal,
                    fontSize = 10.sp,
                    color = Color.Black
                )
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(
                        painter = painterResource(R.drawable.arrow_download),
                        contentDescription = "Downloads",
                        tint = Color.Gray,
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(
                        text = material.downloadCount.toString(),
                        fontFamily = MontserratFont,
                        fontWeight = FontWeight.Normal,
                        fontSize = 10.sp,
                        color = Color(0xFF9E9E9E)
                    )
                }

                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(
                        painter = painterResource(R.drawable.fi_eye),
                        contentDescription = "Views",
                        tint = Color.Gray,
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(
                        text = material.viewCount.toString(),
                        fontFamily = MontserratFont,
                        fontWeight = FontWeight.Normal,
                        fontSize = 10.sp,
                        color = Color(0xFF9E9E9E)
                    )
                }
            }
        }
    }
}
