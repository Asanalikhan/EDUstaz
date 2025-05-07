package com.example.edustaz.ui.components

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.data.model.ItemTest
import com.example.edustaz.ui.theme.MontserratFont
import kotlin.random.Random

@Composable
fun Qatyshushy(
    onItemClick: () -> Unit,
    onStartOlympiad: () -> Unit,
) {

    var text by remember { mutableStateOf("") }
    var itemList by remember { mutableStateOf(listOf<ItemTest>()) }
    var showDialog by remember { mutableStateOf(false) }

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(25.dp),
        colors = CardDefaults.cardColors(containerColor = Color.White),
        border = BorderStroke(0.5.dp, Color(0xFF4741E1)),
        shape = RoundedCornerShape(10.dp)
    ) {
        Spacer(modifier = Modifier.height(9.dp))
        Text(
            text = "Қатысушылар",
            fontSize = 13.sp,
            fontFamily = MontserratFont,
            fontWeight = FontWeight.Medium,
            color = Color(0xFF4741E1),
            textAlign = TextAlign.Center,
            modifier = Modifier
                .fillMaxWidth()
        )
        CustomTextField(text, onValueChange = { text = it })
        Row(
            modifier = Modifier
                .padding(25.dp, 0.dp, 0.dp, 20.dp)
        ) {
            TextButton(
                onClick = {
                    if (text.isNotEmpty()) {
                        itemList = itemList + ItemTest(text, Random.nextInt(1000, 9999))
                        text = ""
                    }
                },
                modifier = Modifier
                    .height(30.dp)
                    .width(80.dp),
                shape = RoundedCornerShape(5.dp),
                colors = ButtonDefaults.buttonColors(
                    contentColor = Color.White,
                    containerColor = Color(0xFF298634)
                ),
                contentPadding = PaddingValues(0.dp)
            ) {
                Text(
                    text = "Сақтау",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Normal,
                    fontSize = 10.sp,
                    color = Color.White
                )
            }
            Spacer(modifier = Modifier.width(11.dp))
            TextButton(
                onClick = { onItemClick() },
                modifier = Modifier
                    .height(30.dp)
                    .width(80.dp),
                shape = RoundedCornerShape(5.dp),
                colors = ButtonDefaults.textButtonColors(
                    contentColor = Color.White,
                    containerColor = Color(0xFFFE5E5E)
                ),
                contentPadding = PaddingValues(0.dp)
            ) {
                Text(
                    text = "Болдырмау",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Normal,
                    fontSize = 10.sp,
                    color = Color.White
                )
            }
        }

        Spacer(modifier = Modifier.height(9.dp))

        itemList.forEachIndexed { index, item ->
            Row {
                Text(
                    text = "${index + 1}. ",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Medium,
                    fontSize = 10.sp,
                    modifier = Modifier.padding(25.dp, 0.dp, 0.dp, 0.dp)
                )
                Text(
                    text = item.name,
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Medium,
                    fontSize = 10.sp,
                    modifier = Modifier.padding(25.dp, 0.dp, 0.dp, 0.dp)
                )
                Text(
                    text = item.code.toString(),
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Medium,
                    fontSize = 10.sp,
                    modifier = Modifier.padding(25.dp, 0.dp, 0.dp, 0.dp)
                )
            }
        }


        Spacer(modifier = Modifier.height(20.dp))
    }

    Spacer(modifier = Modifier.height(16.dp))

    TextButton(
        onClick = { showDialog = true },
        modifier = Modifier
            .fillMaxWidth()
            .height(40.dp)
            .padding(horizontal = 25.dp),
        shape = RoundedCornerShape(5.dp),
        colors = ButtonDefaults.buttonColors(
            contentColor = Color.White,
            containerColor = Color(0xFF4741E1)
        ),
        contentPadding = PaddingValues(0.dp)
    ) {
        Text(
            text = "Код еңгізу",
            fontFamily = MontserratFont,
            fontWeight = FontWeight.Medium,
            fontSize = 14.sp,
            color = Color.White
        )
    }

    if (showDialog) {
        EnterCodePopup(
            onDismiss = { showDialog = false },
            onStartOlympiad = { code ->
                onStartOlympiad()
            }
        )
    }
}