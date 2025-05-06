package com.example.edustaz.data.model

import com.google.gson.annotations.SerializedName

data class OlympiadListResponseItem(
    @SerializedName("category")
    val category: Category,
    @SerializedName("full_name")
    val fullName: String,
    @SerializedName("id")
    val id: Int,
    @SerializedName("price")
    val price: String, // 490.00
    @SerializedName("short_name")
    val shortName: String
) {
    data class Category(
        @SerializedName("id")
        val id: Int,
        @SerializedName("title")
        val title: String
    )
}
