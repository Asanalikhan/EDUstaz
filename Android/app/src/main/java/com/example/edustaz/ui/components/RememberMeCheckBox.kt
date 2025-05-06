package com.example.edustaz.ui.components

import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material3.Checkbox
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier

@Composable
fun RememberMeCheckBox(modifier: Modifier = Modifier) {
    var isChecked by remember { mutableStateOf(false) }

    Row(modifier = modifier.fillMaxWidth(), verticalAlignment = Alignment.CenterVertically) {
        Checkbox(
            checked = isChecked,
            onCheckedChange = { isChecked = it }
        )
        Text(text = "Мені сақтау", modifier = Modifier.align(Alignment.CenterVertically))
    }
}
