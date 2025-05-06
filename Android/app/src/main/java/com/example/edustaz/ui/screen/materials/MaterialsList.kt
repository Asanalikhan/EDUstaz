package com.example.edustaz.ui.screen.materials

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.edustaz.data.model.MaterialsResponse
import com.example.edustaz.ui.components.MaterialItem

@Composable
fun MaterialsList(
    materials: List<MaterialsResponse.Result>,
    onItemClick: (Int) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(horizontal = 16.dp, vertical = 8.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        items(materials) { item ->
            MaterialItem(item, onItemClick = onItemClick)
        }
    }
}

