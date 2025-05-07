package com.example.edustaz.ui.screen.profile

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.example.edustaz.R
import com.example.edustaz.ui.navigation.BottomNavBar
import com.example.edustaz.ui.navigation.TopAppBar
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun TirkeluPage(
    title: String,
    navController: NavController,
    type: Boolean
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
        },
        bottomBar = {
            BottomNavBar(
                navController = navController,
                onItemClick = { navController.navigate(it.route) }
            )
        }
    ) { values ->

        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(values)
                .background(Color(0xFFF5F5F5))
        ){
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(10.dp)
                    .background(Color.White, shape = RoundedCornerShape(5.dp)),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = "Мен тілкелген ${if(type) "олимпиадаларым" else "курстарым"}",
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(top = 36.dp),
                    fontSize = 14.sp,
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Medium,
                    textAlign = TextAlign.Center,
                )

                Spacer(modifier = Modifier.height(200.dp))
                Icon(
                    painter = painterResource(R.drawable.et_search),
                    contentDescription = "Course Icon",
                    modifier = Modifier.align(Alignment.CenterHorizontally)
                )
                Spacer(modifier = Modifier.height(10.dp))
                Text(
                    text = "Сіз ешқандай ${if(type) "олимпиадаларға" else "курстарға"} тіркелмегенсіз",
                    fontWeight = FontWeight.Medium,
                    fontSize = 9.sp,
                    fontFamily = MontserratFont,
                    textAlign = TextAlign.Center
                )
                Spacer(modifier = Modifier.height(20.dp))
                Button(
                    onClick = {
                        navController.popBackStack()
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .align(Alignment.CenterHorizontally)
                        .height(48.dp)
                        .padding(horizontal = 50.dp ),
                    colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF4A35EF)),
                    shape = RoundedCornerShape(12.dp),
                ) {
                    Text(
                        text = "Тіркелу",
                        color = Color.White,
                        fontSize = 14.sp,
                        fontFamily = MontserratFont
                    )
                }
            }
        }

    }
}