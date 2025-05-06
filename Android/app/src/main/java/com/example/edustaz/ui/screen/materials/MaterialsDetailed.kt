package com.example.edustaz.ui.screen.materials

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
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
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.edustaz.R
import com.example.edustaz.data.model.MaterialItem
import com.example.edustaz.data.remote.NetworkResponse
import com.example.edustaz.data.remote.PreferencesManager
import com.example.edustaz.ui.components.BlueButtons
import com.example.edustaz.ui.components.Button
import com.example.edustaz.ui.components.ColoredWordsText
import com.example.edustaz.ui.components.InfiniteMaterialList
import com.example.edustaz.ui.theme.MontserratFont

private val sampleMaterials = listOf(
    MaterialItem(
        "Балалардың сауат ашу деңгейі", "Сәкен Серікұлы", 713, 713
    ),
    MaterialItem("Қысқаша көбейту формулалары", "Сәкен Серікұлы", 1024, 1500),
    MaterialItem("Математикалық логика негіздері", "Айжан Баймұратова", 530, 870),
    MaterialItem("Физикалық заңдар", "Жандос Мұхаммед", 420, 690),
    MaterialItem("Абайдың қара сөздері", "Айгүл Нұрбекова", 860, 1020)
)

@Composable
fun MaterialsDetailed(
    id: Int,
    onBackClick: () -> Unit,
    viewModel: MaterialsViewModel
) {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .background(Color(0xFFF5F5F5)),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        item {
            val sharedPreferences = PreferencesManager(context = LocalContext.current)
            val token = sharedPreferences.getString("user_token")

            val response = viewModel.materialByIdResponse.observeAsState()
            LaunchedEffect(Unit) {
                viewModel.getMaterialById(token = token, id = id)
            }

            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(20.dp)
            ) {
                IconButton(
                    modifier = Modifier
                        .padding(start = 10.dp),
                    onClick = {
                        onBackClick()
                    }
                ) {
                    Icon(
                        imageVector = Icons.AutoMirrored.Filled.ArrowBack,
                        contentDescription = "Back"
                    )
                }
                Text(
                    "Үздік материалдар",
                    fontFamily = MontserratFont,
                    fontSize = 17.sp,
                    fontWeight = FontWeight.Medium,
                    color = Color.Black,
                    modifier = Modifier
                        .padding(0.dp, 0.dp, 60.dp, 0.dp)
                        .fillMaxWidth(),
                    textAlign = TextAlign.Center
                )
            }
            InfiniteMaterialList(materials = sampleMaterials)

            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(20.dp, 9.dp)
                    .background(
                        Color.White,
                        shape = RoundedCornerShape(5.dp)
                    ),
            ) {
                when (val result = response.value) {
                    is NetworkResponse.Success -> {
                        val material = result.data
                        Text(
                            text = material.title,
                            modifier = Modifier
                                .padding(start = 15.dp, top = 10.dp),
                            color = Color.Green,
                            fontFamily = MontserratFont,
                            fontWeight = FontWeight.Medium,
                            fontSize = 17.sp
                        )
                        Text(
                            text = material.description,
                            modifier = Modifier
                                .padding(start = 15.dp, top = 22.dp, end = 15.dp),
                            fontFamily = MontserratFont,
                            fontWeight = FontWeight.Normal,
                            fontSize = 12.sp
                        )
                        Text(
                            text = "Автор:",
                            modifier = Modifier
                                .padding(start = 22.dp, top = 10.dp),
                            fontFamily = MontserratFont,
                            fontWeight = FontWeight.Normal,
                            fontSize = 15.sp
                        )
                        Row(
                            modifier = Modifier
                                .padding(22.dp, 0.dp)
                                .fillMaxWidth(),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                painter = painterResource(R.drawable.frame_12645),
                                contentDescription = "Author"
                            )
                            Spacer(modifier = Modifier.width(5.dp))
                            Text(
                                text = material.user,
                                fontFamily = MontserratFont,
                                fontWeight = FontWeight.Normal,
                                fontSize = 13.sp,
                            )
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth(),
                                horizontalArrangement = Arrangement.End
                            ) {
                                Row(verticalAlignment = Alignment.CenterVertically) {
                                    Icon(
                                        painter = painterResource(R.drawable.arrow_download),
                                        contentDescription = "Downloads",
                                        tint = Color.Gray,
                                        modifier = Modifier.size(18.dp)
                                    )
                                    Spacer(modifier = Modifier.width(4.dp))
                                    Text(
                                        text = material.downloadCount.toString(),
                                        fontFamily = MontserratFont,
                                        fontWeight = FontWeight.Normal,
                                        fontSize = 13.sp,
                                        color = Color(0xFF9E9E9E)
                                    )
                                }
                                Spacer(modifier = Modifier.width(7.dp))
                                Row(verticalAlignment = Alignment.CenterVertically) {
                                    Icon(
                                        painter = painterResource(R.drawable.fi_eye),
                                        contentDescription = "Views",
                                        tint = Color.Gray,
                                        modifier = Modifier.size(18.dp)
                                    )
                                    Spacer(modifier = Modifier.width(4.dp))
                                    Text(
                                        text = material.viewCount.toString(),
                                        fontFamily = MontserratFont,
                                        fontWeight = FontWeight.Normal,
                                        fontSize = 13.sp,
                                        color = Color(0xFF9E9E9E)
                                    )
                                }
                            }
                        }

                        BlueButtons(
                            listOf(
                                material.subject.name,
                                material.group.name,
                                material.className.name
                            )
                        )

                        Box(
                            modifier = Modifier
                                .padding(20.dp, 0.dp)
                        ) {
                            Button(
                                onClick = {},
                                text = "Тегін жүктеу"
                            )
                        }
                        Spacer(modifier = Modifier.height(13.dp))
                    }

                    is NetworkResponse.Error -> {
                        Box(
                            modifier = Modifier
                                .fillMaxSize(),
                            contentAlignment = Alignment.Center
                        ) {
                            Text(
                                text = "Қате орын алды: ${result.message}",
                                color = Color.Red,
                                fontSize = 16.sp,
                                textAlign = TextAlign.Center
                            )
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

            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(20.dp, 8.dp)
                    .background(
                        Color.White,
                        shape = RoundedCornerShape(5.dp)
                    ),
            ) {
                ColoredWordsText()
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(17.dp, 0.dp)
                ) {
                    Text(
                        text = "Қазақстан Республикасының білім беру жүйесін дамытуға қосқан жеке үлесі үшін және де Республика деңгейінде «EDUSTAZ» Республикалық ғылыми – әдістемелік журналының желілік басылымына өз авторлық материалыңызбен бөлісіп, белсенді болғаныңыз үшін алғыс білдіреміз!",
                        fontFamily = MontserratFont,
                        fontWeight = FontWeight.Medium,
                        fontSize = 11.sp,
                        modifier = Modifier
                            .fillMaxWidth(0.8f)
                    )
                    Image(
                        painter = painterResource(R.drawable.img_certificate),
                        contentDescription = "Algys hat",
                        modifier = Modifier
                            .width(88.dp)
                            .height(114.dp)
                    )
                }
                Box(
                    modifier = Modifier
                        .padding(100.dp, 9.dp)
                ) {
                    Button(
                        onClick = {},
                        text = "Жүктеу"
                    )
                }
            }

        }
    }
}

