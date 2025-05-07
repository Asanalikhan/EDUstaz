package com.example.edustaz.data.model


import com.google.gson.annotations.SerializedName

data class MaterialResponse(
    @SerializedName("access")
    val access: Boolean,
    @SerializedName("approved_at")
    val approvedAt: Any,
    @SerializedName("class_name")
    val className: ClassName,
    @SerializedName("created_at")
    val createdAt: String,
    @SerializedName("description")
    val description: String,
    @SerializedName("download_count")
    val downloadCount: Int,
    @SerializedName("group")
    val group: Group,
    @SerializedName("id")
    val id: Int,
    @SerializedName("price")
    val price: Int,
    @SerializedName("status")
    val status: String,
    @SerializedName("subject")
    val subject: Subject,
    @SerializedName("title")
    val title: String,
    @SerializedName("uri")
    val uri: String,
    @SerializedName("user")
    val user: String,
    @SerializedName("view_count")
    val viewCount: Int
) {
    data class ClassName(
        @SerializedName("id")
        val id: Int,
        @SerializedName("name")
        val name: String
    )

    data class Group(
        @SerializedName("id")
        val id: Int,
        @SerializedName("name")
        val name: String
    )

    data class Subject(
        @SerializedName("id")
        val id: Int,
        @SerializedName("name")
        val name: String
    )
}