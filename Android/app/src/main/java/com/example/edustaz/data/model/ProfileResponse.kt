package com.example.edustaz.data.model


import com.google.gson.annotations.SerializedName

data class ProfileResponse(
    @SerializedName("balance")
    val balance: String, // 0.00
    @SerializedName("bonus")
    val bonus: String, // 0.00
    @SerializedName("email")
    val email: String, // user@example.com
    @SerializedName("father_name")
    val fatherName: String, // string
    @SerializedName("first_name")
    val firstName: String, // string
    @SerializedName("id")
    val id: Int, // 1005
    @SerializedName("last_name")
    val lastName: String, // string
    @SerializedName("phone_number")
    val phoneNumber: String, // string
    @SerializedName("profile_photo")
    val profilePhoto: String, // https://ziatkeradmin.kz/static/main/img/avatars/22.png
    @SerializedName("username")
    val username: String // user@example.com
)