package com.example.edustaz.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun EnterCodePopup(
    onDismiss: () -> Unit,
    onStartOlympiad: (String) -> Unit
) {
    var code by remember { mutableStateOf("") }

    Dialog(onDismissRequest = { onDismiss() }) {
        Box(
            modifier = Modifier
                .background(Color.White, shape = RoundedCornerShape(10.dp))
                .padding(24.dp)
        ) {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(
                    text = "Код теріңіз",
                    fontSize = 16.sp,
                    fontWeight = FontWeight.SemiBold,
                    fontFamily = MontserratFont,
                    textAlign = TextAlign.Center
                )

                Spacer(modifier = Modifier.height(9.dp))

                TextField(
                    value = code,
                    onValueChange = { code = it },
                    shape = RoundedCornerShape(10.dp),
                    singleLine = true,
                    textStyle = TextStyle(
                        fontSize = 13.sp,
                        fontFamily = MontserratFont,
                        fontWeight = FontWeight.Medium
                    ),
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(Color(0xFFE6ECF6), RoundedCornerShape(10.dp)),
                    colors = TextFieldDefaults.colors(
                        unfocusedIndicatorColor = Color.Transparent,
                        focusedIndicatorColor = Color.Transparent,
                        disabledIndicatorColor = Color.Transparent,
                        focusedContainerColor = Color(0xFFE6ECF6),
                        unfocusedContainerColor = Color(0xFFE6ECF6),
                        disabledContainerColor = Color(0xFFE6ECF6)
                    )
                )
                Spacer(modifier = Modifier.height(7.dp))

                Button(
                    onClick = {
                        val codeInt = code.toIntOrNull()
                        if (codeInt != null && codeInt in 1000..9999) {
                            onStartOlympiad(code)
                            onDismiss()
                        }
                    },
                    shape = RoundedCornerShape(10.dp),
                    colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF4741E1)),
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text(
                        "Олимпиада бастау",
                        color = Color.White,
                        fontSize = 13.sp,
                        fontFamily = MontserratFont,
                        fontWeight = FontWeight.Medium
                    )
                }
            }
        }
    }
}
