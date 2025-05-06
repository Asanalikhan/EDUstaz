package com.example.edustaz.ui.screen.notification

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.navigation.NavController
import com.example.edustaz.ui.components.NotificationCard
import com.example.edustaz.ui.navigation.BottomNavBar
import com.example.edustaz.ui.navigation.TopAppBar

val notifications = listOf(
    Triple(
        "Жаңа материал",
        "Сізге жаңа материал қолжетімді. Өзіңізге ыңғайлы уақытта қарап шығыңыз.",
        "13:04"
    ),
    Triple(
        "Сыйлық",
        "Сіз марапатқа ие болдыңыз. Жеке кабинеттен толығырақ ақпарат алыңыз.",
        "15:00"
    ),
    Triple("Жаңарту", "Қосымша жаңартылды. Жаңа мүмкіндіктер мен тұрақтылық жақсартылды.", "03:41"),
    Triple(
        "Хабарлама",
        "Сізге жаңа хабарлама келді. Тексеріп, уақтылы жауап беруді ұмытпаңыз.",
        "09:25"
    ),
    Triple("Тапсырма", "Жаңа тапсырма жүктелді. Орындау мерзімі - келесі апта.", "11:10"),
    Triple("Құттықтау", "Сіз сәтті тіркелдіңіз! Енді сізге барлық функционал қолжетімді.", "08:00"),
    Triple(
        "Ескерту",
        "Сіздің тест уақытыңыз аяқталуға жақын. Жауаптарыңызды тексеріп, жіберуді ұмытпаңыз.",
        "16:45"
    )
)

@Composable
fun NotificationPage(
    title: String,
    navController: NavController
) {
    Scaffold(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.White),
        topBar = {
            TopAppBar(
                title = title,
                navController = navController
            )
        }, bottomBar = {
            BottomNavBar(
                navController = navController,
                onItemClick = { navController.navigate(it.route) }
            )
        }
    ) { values ->
        LazyColumn(
            modifier = Modifier
                .padding(values)
                .fillMaxSize()
                .background(Color(0xFFF5F5F5))
        ) {
            items(notifications) { (title, message, time) ->
                NotificationCard(title = title, message = message, time = time)
            }
        }

    }
}