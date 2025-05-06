package com.example.edustaz.ui.screen.materials

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.example.edustaz.data.model.NamedItem
import com.example.edustaz.data.remote.NetworkResponse
import com.example.edustaz.data.remote.PreferencesManager
import com.example.edustaz.ui.components.DirectionDropdown
import com.example.edustaz.ui.components.SearchComponent
import com.example.edustaz.ui.navigation.BottomNavBar
import com.example.edustaz.ui.navigation.TopAppBar
import com.example.edustaz.ui.theme.MontserratFont

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MaterialsPage(
    title: String, navController: NavController, viewModel: MaterialsViewModel
) {

    Scaffold(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.White),
        topBar = {
            TopAppBar(
                title = title, navController = navController
            )
        }, bottomBar = {
            BottomNavBar(
                navController = navController, onItemClick = {
                    navController.navigate(it.route)
                })
        }) { values ->

        var query by remember { mutableStateOf("") }
        var bagyt by remember { mutableIntStateOf(0) }
        var synyp by remember { mutableIntStateOf(0) }
        var pan by remember { mutableIntStateOf(0) }

        val filterResponse = viewModel.filterResponse.observeAsState()
        val filteredData = (filterResponse.value as? NetworkResponse.Success)?.data

        val classList = filteredData?.classes ?: emptyList()
        val classItems = classList.map { NamedItem(it.id, it.name) }

        val groupList = filteredData?.groups ?: emptyList()
        val groupItems = groupList.map { NamedItem(it.id, it.name) }

        val subjectList = filteredData?.subjects ?: emptyList()
        val subjectItems = subjectList.map { NamedItem(it.id, it.name) }

        val materialsResponse = viewModel.materialsResponse.observeAsState()

        val sharedPreferences = PreferencesManager(context = LocalContext.current)
        val token = sharedPreferences.getString("user_token")

        var materialClicked by remember { mutableIntStateOf(0) }

        LaunchedEffect(Unit) {
            viewModel.getFilter(token)
            viewModel.getMaterials(token)
        }

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(values)
                .background(Color(0xFFF5F5F5))
        ) {

            Text(
                "Оқу әдістемелік материалдар",
                fontFamily = MontserratFont,
                fontWeight = FontWeight.Medium,
                fontSize = 18.sp,
                modifier = Modifier.padding(top = 11.dp, start = 27.dp)
            )

            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 0.dp)
            ) {
                SearchComponent(
                    query = query, onQueryChanged = { query = it })
            }

            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                DirectionDropdown(
                    "Бағыт",
                    onItemSelected = {
                        bagyt = it
                        materialClicked = 0
                    },
                    groupItems,
                )
                DirectionDropdown("Сынып", onItemSelected = {
                    synyp = it
                    materialClicked = 0
                }, classItems)
                DirectionDropdown("Пән", onItemSelected = {
                    pan = it
                    materialClicked = 0
                }, subjectItems)
            }

            when (val response = materialsResponse.value) {
                is NetworkResponse.Success -> {
                    val filteredMaterials = response.data.results.filter { material ->
                        (bagyt == 0 || material.group.id == bagyt) &&
                                (synyp == 0 || material.className.id == synyp) &&
                                (pan == 0 || material.subject.id == pan) &&
                                material.title.contains(query, ignoreCase = true)
                    }
                    if (filteredMaterials.isEmpty()) {
                        Text("Нәтижелер табылмады", modifier = Modifier.padding(16.dp))
                    } else if (materialClicked == 0) {
                        MaterialsList(materials = filteredMaterials, onItemClick = {
                            materialClicked = it
                        })
                    } else {
                        MaterialsDetailed(
                            materialClicked,
                            onBackClick = { materialClicked = 0 },
                            viewModel = viewModel
                        )
                    }
                }

                is NetworkResponse.Error -> {
                    Box(
                        modifier = Modifier
                            .fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Text(response.message)
                    }
                }

                NetworkResponse.Loading -> {
                    Box(
                        modifier = Modifier
                            .fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator()
                    }
                }

                null -> {
                    Box(
                        modifier = Modifier
                            .fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Text("Мәлімет табылмады", fontSize = 16.sp)
                    }
                }
            }
        }
    }
}