package com.example.edustaz.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.wrapContentWidth
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.OutlinedTextField
import androidx.compose.material.TextFieldDefaults
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.CloudUpload
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.data.model.NamedItem
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun UploadMaterialScreen(
    onItemClick: (Int) -> Unit,
    onBackClick: () -> Unit
) {
    val title = remember { mutableStateOf("") }
    val description = remember { mutableStateOf("") }
    val fullName = remember { mutableStateOf("") }

    val directionOptions =
        listOf("Бағыт", "Мақала", "Ашық сабақ", "Тренерлерге", "Конспект", "Тест", "Сабақ жоспары")
    val gradeOptions = listOf(
        "Сынып",
        "1 сынып",
        "2 сынып",
        "6 сынып",
        "7 сынып",
        "8 сынып",
        "9 сынып",
        "10 сынып",
        "11 сынып"
    )
    val subjectOptions = listOf(
        "Пән",
        "Математика",
        "Физика",
        "Химия",
        "Биология",
        "География",
        "Тарих",
        "Ағылшын тілі",
        "Қазақ тілі",
        "Орыс тілі"
    )

    var selectedDirection by remember { mutableStateOf(directionOptions.first()) }
    var selectedGrade by remember { mutableStateOf(gradeOptions.first()) }
    var selectedSubject by remember { mutableStateOf(subjectOptions.first()) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(10.dp)
            .verticalScroll(rememberScrollState())
            .background(
                Color.White,
                shape = RoundedCornerShape(5.dp)
            )
            .clip(shape = RoundedCornerShape(5.dp)),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Материал ақпаратын енгізу",
            fontWeight = FontWeight.Medium,
            fontFamily = MontserratFont,
            fontSize = 14.sp,
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 17.dp, start = 20.dp),
            textAlign = TextAlign.Start
        )

        Spacer(Modifier.height(17.dp))

        Box(
            modifier = Modifier
                .padding(20.dp, 0.dp)
        ) {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(100.dp) // increased from 100.dp to account for padding
                    .clickable { /* File upload logic */ }
                    .border(0.dp, Color.Transparent)
                    .background(Color(0xFFE6ECF6), shape = RoundedCornerShape(5.dp)),
                contentAlignment = Alignment.Center
            ) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(Icons.Default.CloudUpload, contentDescription = null)
                    Text(
                        "Файлды жүктеу",
                        fontFamily = MontserratFont,
                        fontWeight = FontWeight.Normal,
                        fontSize = 10.sp
                    )
                }
            }
        }

        OutlinedTextField(
            value = title.value,
            onValueChange = { title.value = it },
            label = {
                Text(
                    "Материал тақырыбы",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Normal,
                    fontSize = 10.sp
                )
            },
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 20.dp),
            colors = TextFieldDefaults.outlinedTextFieldColors(
                backgroundColor = Color(0xFFE6ECF6),
                focusedBorderColor = Color.Transparent,
                unfocusedBorderColor = Color.Transparent,
                disabledBorderColor = Color.Transparent,
                errorBorderColor = Color.Transparent
            ),
            shape = RoundedCornerShape(5.dp)
        )

        Spacer(Modifier.height(6.dp))

        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp, 0.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
        ) {
            GreyBackgroundDropdown(
                selectedText = selectedDirection,
                onItemSelected = { selectedId ->
                    selectedDirection = directionOptions[selectedId]
                },
                list = directionOptions.mapIndexed { index, name ->
                    NamedItem(
                        id = index,
                        name = name
                    )
                }
            )

            GreyBackgroundDropdown(
                selectedText = selectedGrade,
                onItemSelected = { selectedId ->
                    selectedGrade = gradeOptions[selectedId]
                },
                list = gradeOptions.mapIndexed { index, name -> NamedItem(id = index, name = name) }
            )

            GreyBackgroundDropdown(
                selectedText = selectedSubject,
                onItemSelected = { selectedId ->
                    selectedSubject = subjectOptions[selectedId]
                },
                list = subjectOptions.mapIndexed { index, name ->
                    NamedItem(
                        id = index,
                        name = name
                    )
                }
            )


        }

        OutlinedTextField(
            value = description.value,
            onValueChange = { description.value = it },
            label = {
                Text(
                    "Материал туралы қысқаша түсінік",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Normal,
                    fontSize = 10.sp
                )
            },
            modifier = Modifier
                .fillMaxWidth()
                .height(100.dp)
                .padding(horizontal = 20.dp),
            colors = TextFieldDefaults.outlinedTextFieldColors(
                backgroundColor = Color(0xFFE6ECF6),
                focusedBorderColor = Color.Transparent,
                unfocusedBorderColor = Color.Transparent,
                disabledBorderColor = Color.Transparent,
                errorBorderColor = Color.Transparent
            ),
            shape = RoundedCornerShape(5.dp)
        )

        OutlinedTextField(
            value = fullName.value,
            onValueChange = { fullName.value = it },
            label = {
                Text(
                    "Сертификат алушының толық аты-жөні",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Normal,
                    fontSize = 10.sp
                )
            },
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 20.dp),
            colors = TextFieldDefaults.outlinedTextFieldColors(
                backgroundColor = Color(0xFFE6ECF6),
                focusedBorderColor = Color.Transparent,
                unfocusedBorderColor = Color.Transparent,
                disabledBorderColor = Color.Transparent,
                errorBorderColor = Color.Transparent
            ),
            shape = RoundedCornerShape(5.dp)
        )

        Spacer(Modifier.height(6.dp))

        Button(
            onClick = { onBackClick() },
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp, 0.dp),
            shape = RoundedCornerShape(5.dp),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF4741E1)),

            ) {
            Text(
                "Материалды жүктеу",
                color = Color.White,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Normal,
                fontSize = 12.sp
            )
        }

        Text(
            "Менің материалдарым",
            fontSize = 14.sp,
            fontFamily = MontserratFont,
            fontWeight = FontWeight.Medium,
            modifier = Modifier
                .fillMaxWidth()
                .padding(start = 20.dp, top = 10.dp),
            textAlign = TextAlign.Start
        )

        Spacer(Modifier.height(10.dp))

        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 20.dp)
                .clickable { onItemClick(1) }
                .border(1.dp, Color(0xFFD9D9D9), shape = RoundedCornerShape(5.dp)),
            horizontalAlignment = Alignment.Start
        ) {
            Text(
                text = "Тест",
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 12.sp,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(start = 20.dp, top = 10.dp, bottom = 3.dp),
                color = Color(0xFF4741E1),
                textAlign = TextAlign.Start
            )

            Row(
                modifier = Modifier
                    .wrapContentWidth()
                    .padding(bottom = 10.dp),
            ) {
                Text(
                    text = "Ашық сабақ",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Light,
                    fontSize = 10.sp,
                    textAlign = TextAlign.Start,
                    modifier = Modifier.padding(start = 20.dp)
                )
                Text(
                    text = "6 сынып",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Light,
                    fontSize = 10.sp,
                    textAlign = TextAlign.Start,
                    modifier = Modifier.padding(start = 10.dp)
                )
                Text(
                    text = "Математика",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Light,
                    fontSize = 10.sp,
                    textAlign = TextAlign.Start,
                    modifier = Modifier.padding(start = 10.dp)
                )
            }
        }

        Spacer(modifier = Modifier.height(7.dp))

        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 20.dp)
                .clickable { onItemClick(1) }
                .border(1.dp, Color(0xFFD9D9D9), shape = RoundedCornerShape(5.dp)),
            horizontalAlignment = Alignment.Start
        ) {
            Text(
                text = "Lesson presentation Healthy habit",
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 12.sp,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(start = 20.dp, top = 10.dp, bottom = 3.dp),
                color = Color(0xFF4741E1),
                textAlign = TextAlign.Start
            )

            Row(
                modifier = Modifier
                    .wrapContentWidth()
                    .padding(bottom = 10.dp),
            ) {
                Text(
                    text = "Мақала",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Light,
                    fontSize = 10.sp,
                    textAlign = TextAlign.Start,
                    modifier = Modifier.padding(start = 20.dp)
                )
                Text(
                    text = "10 сынып",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Light,
                    fontSize = 10.sp,
                    textAlign = TextAlign.Start,
                    modifier = Modifier.padding(start = 10.dp)
                )
                Text(
                    text = "Биология",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Light,
                    fontSize = 10.sp,
                    textAlign = TextAlign.Start,
                    modifier = Modifier.padding(start = 10.dp)
                )
            }
        }

    }
}



