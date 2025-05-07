package com.example.edustaz.ui.screen.olympiad

import androidx.compose.animation.AnimatedContent
import androidx.compose.animation.ExperimentalAnimationApi
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.togetherWith
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.RadioButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
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
import androidx.navigation.NavController
import com.example.edustaz.data.remote.Subject
import com.example.edustaz.ui.components.TestResultDialog
import com.example.edustaz.ui.navigation.BottomNavBar
import com.example.edustaz.ui.navigation.TopAppBar
import com.example.edustaz.ui.theme.MontserratFont

@OptIn(ExperimentalAnimationApi::class)
@Composable
fun TestPage(
    viewModel: QuizViewModel,
    navController: NavController,
    title: String,
    subject: String
) {
    val currentIndex = viewModel.currentQuestionIndex
    LaunchedEffect(Unit) {
        viewModel.setSubject(subjectFromKazakhName(subject))
    }
    val questions = viewModel.questions
    var showDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(title = title, navController = navController)
        },
        bottomBar = {
            BottomNavBar(navController = navController) {
                navController.navigate(it.route)
            }
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .padding(paddingValues)
                .fillMaxSize()
                .background(Color(0xFFF5F5F5))
        ) {
            Column(
                modifier = Modifier
                    .padding(10.dp)
                    .background(Color.White),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                AnimatedContent(
                    targetState = currentIndex,
                    transitionSpec = {
                        fadeIn().togetherWith(fadeOut())
                    },
                    modifier = Modifier.weight(1f)
                ) { index ->
                    if (questions.isNotEmpty()) {
                        val question = questions[index]
                        val selected = viewModel.selectedAnswers[index]

                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            Text(
                                text = "Сұрақ № ${index + 1}/${questions.size}",
                                fontWeight = FontWeight.Medium,
                                fontFamily = MontserratFont,
                                fontSize = 16.sp,
                                textAlign = TextAlign.Start,
                                modifier = Modifier
                                    .padding(start = 34.dp, top = 20.dp)
                                    .fillMaxWidth()
                            )

                            Spacer(modifier = Modifier.height(19.dp))

                            Text(
                                text = question.text,
                                fontWeight = FontWeight.Medium,
                                fontFamily = MontserratFont,
                                fontSize = 13.sp,
                                textAlign = TextAlign.Center,
                                modifier = Modifier
                                    .padding(start = 24.dp, end = 24.dp, bottom = 16.dp)
                            )

                            Column(
                                verticalArrangement = Arrangement.spacedBy(10.dp),
                                modifier = Modifier.padding(35.dp, 19.dp)
                            ) {
                                question.options.forEachIndexed { i, option ->
                                    Row(
                                        verticalAlignment = Alignment.CenterVertically,
                                        modifier = Modifier
                                            .fillMaxWidth()
                                            .clip(RoundedCornerShape(10.dp))
                                            .background(Color(0xFFE6ECF6))
                                            .clickable { viewModel.selectAnswer(i) }
                                            .padding(12.dp, 0.dp)
                                    ) {
                                        RadioButton(
                                            selected = selected == i,
                                            onClick = { viewModel.selectAnswer(i) }
                                        )
                                        Spacer(modifier = Modifier.width(8.dp))
                                        Text(
                                            text = option,
                                            fontFamily = MontserratFont,
                                            fontWeight = FontWeight.Normal,
                                            fontSize = 13.sp
                                        )
                                    }
                                }
                            }
                        }
                    } else {
                        Box(
                            modifier = Modifier
                                .fillMaxSize(),
                            contentAlignment = Alignment.Center
                        ){
                            CircularProgressIndicator()
                        }
                    }
                }

                Column(
                    verticalArrangement = Arrangement.spacedBy(10.dp),
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(35.dp, 24.dp)
                ) {
                    if (!viewModel.isLastQuestion()) {
                        Button(
                            onClick = { viewModel.nextQuestion() },
                            modifier = Modifier.fillMaxWidth(),
                            colors = ButtonDefaults.buttonColors(
                                containerColor = Color(0xFF4741E1),
                                contentColor = Color.White
                            ),
                            shape = RoundedCornerShape(10.dp)
                        ) {
                            Text("Келесі сұраққа өту")
                        }
                    }

                    Button(
                        onClick = {
                            showDialog = true
                        },
                        modifier = Modifier.fillMaxWidth(),
                        colors = ButtonDefaults.buttonColors(
                            containerColor = Color(0xFF4741E1),
                            contentColor = Color.White
                        ),
                        shape = RoundedCornerShape(10.dp)
                    ) {
                        Text("Тестті аяқтау")
                    }
                }
            }

            if (showDialog) {
                TestResultDialog(
                    score = viewModel.getScore(),
                    total = questions.size,
                    onBackToHome = {
                        showDialog = false
                        navController.popBackStack()
                    },
                    onDismiss = { showDialog = false }
                )
            }
        }
    }
}

private fun subjectFromKazakhName(name: String): Subject? {
    return when (name) {
        "Қазақстан тарихы" -> Subject.KzHistory
        "Математика" -> Subject.Math
        "Қазақ тілі" -> Subject.Kazakh
        "Биология" -> Subject.Biology
        "География" -> Subject.Geography
        "Жаратылыстану" -> Subject.NatScience
        "Ағылшын тілі" -> Subject.English
        "Информатика" -> Subject.Informatika
        "Дене шынықтыру" -> Subject.Pe
        "Музыка" -> Subject.Music
        "Тарих" -> Subject.WorldHistory
        "Физика" -> Subject.Physics
        "Еңбек" -> Subject.Work
        "Химия" -> Subject.Chemistry
        "Психология" -> Subject.Psychology
        "Орыс тілі" -> Subject.Russian
        "Педагогика" -> Subject.Pedagogy
        else -> Subject.General
    }
}

