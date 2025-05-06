package com.example.edustaz.data.model


import com.google.gson.annotations.SerializedName

data class LoginResponse(
    @SerializedName("access")
    val access: String,
    @SerializedName("refresh")
    val refresh: String,
    @SerializedName("status")
    val status: String
)