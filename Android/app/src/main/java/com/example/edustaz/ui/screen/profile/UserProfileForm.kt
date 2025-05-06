package com.example.edustaz.ui.screen.profile

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
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
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.R
import com.example.edustaz.data.model.ProfileUpdateRequest
import com.example.edustaz.ui.components.CustomInputField

@Composable
fun UserProfileForm(
    onClick: () -> Unit,
    viewModel: ProfileViewModel,
    firstName: String,
    lastName: String,
    token: String
) {
    var first by remember { mutableStateOf(firstName) }
    var last by remember { mutableStateOf(lastName) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.White)
            .padding(16.dp)
    ) {
        Text("Жеке ақпараттар", fontSize = 18.sp, fontWeight = FontWeight.Bold)

        Spacer(modifier = Modifier.height(16.dp))

        Row(
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier
                    .size(100.dp)
                    .border(1.dp, Color.Gray, CircleShape)
                    .clip(CircleShape)
                    .background(Color(0xFFF0F4FF)),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    painter = painterResource(id = R.drawable.ic_camera),
                    contentDescription = null,
                    tint = Color.Gray,
                    modifier = Modifier.size(40.dp)
                )
            }

            Spacer(modifier = Modifier.width(16.dp))

            Column(
                modifier = Modifier.fillMaxWidth()
            ) {
                CustomInputField(
                    placeholder = "Атыңыз",
                    value = first,
                    onValueChange = { first = it })
                Spacer(modifier = Modifier.height(8.dp))
                CustomInputField(
                    placeholder = "Тегіңіз",
                    value = lastName,
                    onValueChange = { last = it })
            }
        }

        Spacer(modifier = Modifier.height(24.dp))
        Text("Кәсіби ақпараттар", fontSize = 18.sp, fontWeight = FontWeight.Bold)

        Spacer(modifier = Modifier.height(16.dp))

        Row(modifier = Modifier.fillMaxWidth()) {
            CustomInputField(
                "Облысыңыз", modifier = Modifier.weight(1f), value = "",
                onValueChange = {}
            )
            Spacer(modifier = Modifier.width(8.dp))
            CustomInputField(
                "Ауданды жазыңыз",
                modifier = Modifier.weight(1f),
                value = "",
                onValueChange = {})
        }

        Spacer(modifier = Modifier.height(8.dp))

        Row(modifier = Modifier.fillMaxWidth()) {
            CustomInputField(
                "Мектепті жазыңыз",
                modifier = Modifier.weight(1f),
                value = "",
                onValueChange = {})
            Spacer(modifier = Modifier.width(8.dp))
            CustomInputField(
                "Лауазымыңыз",
                modifier = Modifier.weight(1f),
                value = "",
                onValueChange = {})
        }

        Spacer(modifier = Modifier.height(8.dp))

        CustomInputField(
            "Өзіңіз жайлы қосымша мәлімет",
            modifier = Modifier
                .fillMaxWidth()
                .height(100.dp),
            singleLine = false,
            value = "", onValueChange = {}
        )

        Spacer(modifier = Modifier.height(24.dp))

        Button(
            onClick = {
                viewModel.putProfileData(
                    token = token,
                    ProfileUpdateRequest("aaaa@mail.com", first, last)
                )
                onClick()
            },
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF6C4EFF)),
            shape = RoundedCornerShape(8.dp),
            modifier = Modifier
                .fillMaxWidth()
                .height(50.dp)
        ) {
            Text("Сақтау", color = Color.White, fontSize = 16.sp)
        }
    }
}


