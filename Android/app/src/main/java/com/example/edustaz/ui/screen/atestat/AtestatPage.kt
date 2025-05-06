package com.example.edustaz.ui.screen.atestat

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Scaffold
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
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.example.edustaz.ui.navigation.BottomNavBar
import com.example.edustaz.ui.navigation.TopAppBar
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun AtestatPage(
    title: String,
    navController: NavController
) {

    var isClicked by remember { mutableStateOf(false) }
    var detailed by remember { mutableStateOf("") }
    val subjects = listOf(
        "Тарих", "Математика", "Жаратылыстану", "Ағылшын тілі",
        "География", "Информатика", "Биология", "Қазақ тілі",
        "Дене шынықтыру", "Музыка", "Қазақстан тарихы", "Физика",
        "Еңбек", "Химия", "Психология", "Орыс тілі",
        "Педагогика", "Тексеру"
    )
    Scaffold(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.White),
        topBar = {
            TopAppBar(
                title = title,
                navController = navController
            )
        },
        bottomBar = {
            BottomNavBar(
                navController = navController,
                onItemClick = {
                    navController.navigate(it.route)
                }
            )
        }
    ) { values ->

        if (isClicked) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(Color(0xFFF5F5F5))
                    .padding(values)
            ) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(9.dp)
                ) {
                    SubjectDetailsPage(
                        subject = detailed,
                        onBack = { isClicked = false },
                        onStartTest = {
                            navController.navigate("test")
                        }
                    )
                }
            }
        } else {
            LazyVerticalGrid(
                columns = GridCells.Fixed(2),
                modifier = Modifier
                    .padding(values)
                    .fillMaxSize()
                    .background(Color(0xFFF5F5F5)),
                verticalArrangement = Arrangement.spacedBy(8.dp),
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                contentPadding = PaddingValues(12.dp)
            ) {
                items(subjects) { subject ->
                    SubjectCard(subject = subject) {
                        detailed = it
                        isClicked = true
                    }
                }
            }
        }

    }
}

@Composable
fun SubjectCard(subject: String, onClick: (String) -> Unit) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .height(90.dp),
        shape = RoundedCornerShape(5.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color.White
        )
    ) {
        Column(
            modifier = Modifier
                .padding(12.dp)
                .fillMaxSize(),
            verticalArrangement = Arrangement.SpaceBetween
        ) {
            Text(
                text = subject,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 14.sp
            )
            Button(
                onClick = { onClick(subject) },
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color(0xFF4A35EF),
                    contentColor = Color.White
                ),
                shape = RoundedCornerShape(6.dp),
                modifier = Modifier.align(Alignment.End)
            ) {
                Text(
                    text = "Толығырақ >",
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Normal,
                    fontSize = 10.sp
                )
            }
        }
    }
}