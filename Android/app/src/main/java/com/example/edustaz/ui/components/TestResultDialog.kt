package com.example.edustaz.ui.components

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import com.example.edustaz.ui.theme.MontserratFont


@Composable
fun TestResultDialog(
    score: Int,
    total: Int,
    onBackToHome: () -> Unit,
    onDismiss: () -> Unit
) {
    Dialog(onDismissRequest = onDismiss) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
                .background(Color.White, shape = RoundedCornerShape(10.dp))
        ) {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Spacer(modifier = Modifier.height(50.dp))
                Box(
                    contentAlignment = Alignment.Center,
                    modifier = Modifier
                        .size(165.dp)
                        .border(
                            BorderStroke(15.dp, Color(0xFF4741E1)),
                            shape = CircleShape
                        )
                ) {
                    Text(
                        text = "$score/$total",
                        fontSize = 35.sp,
                        fontWeight = FontWeight.SemiBold,
                        fontFamily = MontserratFont,
                        color = Color(0xFF298634)
                    )
                }

                Spacer(modifier = Modifier.height(11.dp))

                Text(
                    text = "Бұл тек бастамасы, шыңдалуды тоқтатпаңыз!",
                    fontSize = 13.sp,
                    textAlign = TextAlign.Center,
                    fontFamily = MontserratFont,
                    fontWeight = FontWeight.Medium
                )

                Spacer(modifier = Modifier.height(16.dp))

                Button(
                    onClick = onBackToHome,
                    colors = ButtonDefaults.buttonColors(Color(0xFF4741E1)),
                    shape = RoundedCornerShape(10.dp),
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(55.dp, 0.dp)
                ) {
                    Text("Басты бетке өту", color = Color.White)
                }
                Spacer(modifier = Modifier.height(50.dp))
            }
        }
    }
}
