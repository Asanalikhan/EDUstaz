package com.example.edustaz.data.model

import com.google.gson.annotations.SerializedName

data class FilterResponse(
    @SerializedName("classes")
    val classes: List<NamedItem>,
    @SerializedName("groups")
    val groups: List<NamedItem>,
    @SerializedName("subjects")
    val subjects: List<NamedItem>
)

data class NamedItem(
    @SerializedName("id")
    val id: Int,
    @SerializedName("name")
    val name: String
)
