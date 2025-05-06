package com.example.edustaz.ui.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import com.example.edustaz.R
import com.example.edustaz.data.model.MaterialItem

@Composable
fun InfiniteMaterialList(materials: List<MaterialItem>) {
    var startIndex by remember { mutableIntStateOf(0) }

    Row(
        modifier = Modifier.fillMaxWidth(),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.Center
    ) {
        IconButton(onClick = {
            startIndex = (startIndex - 1 + materials.size) % materials.size
        }, modifier = Modifier.width(25.dp)) {
            Icon(
                painter = painterResource(R.drawable.baseline_keyboard_arrow_left_24),
                contentDescription = "Previous"
            )
        }

        Row(
            modifier = Modifier
                .weight(1f)
                .fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            MaterialCard(materials[startIndex % materials.size])
            MaterialCard(materials[(startIndex + 1) % materials.size])
        }

        IconButton(onClick = {
            startIndex = (startIndex + 1) % materials.size
        }, modifier = Modifier.width(25.dp)) {
            Icon(
                painter = painterResource(R.drawable.baseline_keyboard_arrow_right_24),
                contentDescription = "Next"
            )
        }
    }
}
