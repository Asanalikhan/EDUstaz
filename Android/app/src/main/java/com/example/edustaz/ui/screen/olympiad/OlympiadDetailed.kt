package com.example.edustaz.ui.screen.olympiad

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.R
import com.example.edustaz.data.model.ContentItem
import com.example.edustaz.ui.components.Button
import com.example.edustaz.ui.components.NumberedList
import com.example.edustaz.ui.components.OlympiadCard
import com.example.edustaz.ui.components.Qatyshushy
import com.example.edustaz.ui.theme.MontserratFont

private var descList = listOf(
    ContentItem(R.drawable.ic_atestat, "Олимпиада пәні:", ""),
    ContentItem(R.drawable.ic_olympiad, "Уақыты:", "1-31 Наурыз аралығында"),
    ContentItem(R.drawable.frame_12645, "Қатысушы:", ""),
)

@Composable
fun OlympiadDetailed(
    subject: String,
    type: Boolean,
    onBack: () -> Unit,
    onOlympiadTest: () -> Unit
) {

    var clicked by remember { mutableStateOf(false) }
    val scrollState = rememberScrollState()

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(20.dp, 15.dp)
            .verticalScroll(scrollState)
            .background(Color.White),
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(0.dp, 9.dp)
        ) {
            IconButton(
                onClick = { onBack() },
                modifier = Modifier
                    .size(30.dp)
                    .align(Alignment.CenterVertically)
            ) {
                Icon(
                    imageVector = Icons.AutoMirrored.Default.ArrowBack,
                    contentDescription = "Back",
                )
            }
            Text(
                "Наурыз айында $subject пәнінен ${if (type) "ұстаздар" else "оқушылар"} арасындағы олимпиада",
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 16.sp,
                textAlign = TextAlign.Center,
                modifier = Modifier.padding(0.dp, 0.dp, 30.dp, 0.dp)
            )
        }

        Spacer(modifier = Modifier.height(10.dp))
        descList[0].description = subject
        descList[2].description = if (type) "Ұстаздар арасында" else "Оқұшылар арасында"
        descList.forEach { item ->
            OlympiadCard(item.icon, item.title, item.description)
        }

        if (clicked) {
            Qatyshushy(
                onItemClick = { clicked = false },
                onStartOlympiad = { onOlympiadTest() }
            )
        } else {
            Box(
                modifier = Modifier
                    .padding(20.dp, 10.dp)
            ) {
                Button(
                    onClick = {
                        clicked = true
                    },
                    text = "Қатысушы қосу"
                )
            }
            Spacer(modifier = Modifier.height(10.dp))
            NumberedList()
        }

    }
}