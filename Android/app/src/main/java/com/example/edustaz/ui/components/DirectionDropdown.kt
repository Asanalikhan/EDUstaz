package com.example.edustaz.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.wrapContentWidth
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.data.model.NamedItem
import com.example.edustaz.ui.theme.MontserratFont

@Composable
fun DirectionDropdown(
    selectedText: String,
    onItemSelected: (Int) -> Unit,
    list: List<NamedItem>,
) {
    var expanded by remember { mutableStateOf(false) }

    Box(
        modifier = Modifier
            .wrapContentWidth()
    ) {
        Row(
            modifier = Modifier
                .clickable { expanded = true }
                .background(Color.White)
                .padding(horizontal = 30.dp, vertical = 8.dp),
        ) {
            Text(
                text = selectedText,
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Normal,
                fontSize = 13.sp,
            )
            Icon(
                imageVector = Icons.Default.ArrowDropDown,
                contentDescription = "Dropdown",
                modifier = Modifier.size(20.dp)
            )
        }
        DropdownMenu(
            expanded = expanded,
            onDismissRequest = { expanded = false },
            modifier = Modifier
                .wrapContentWidth()
                .background(Color.White)
        ) {
            list.forEach { item ->
                DropdownMenuItem(
                    text = {
                        Text(
                            text = item.name,
                            fontFamily = MontserratFont,
                            fontWeight = FontWeight.Normal,
                            fontSize = 12.sp,
                        )
                    },
                    onClick = {
                        onItemSelected(item.id)
                        expanded = false
                    }
                )
            }
        }
    }
}