package com.example.edustaz.data.model


import com.google.gson.annotations.SerializedName

data class MaterialResponse(
    @SerializedName("access")
    val access: Boolean, // false
    @SerializedName("approved_at")
    val approvedAt: Any, // null
    @SerializedName("class_name")
    val className: ClassName,
    @SerializedName("created_at")
    val createdAt: String, // 2025-04-12T14:52:13.642094+05:00
    @SerializedName("description")
    val description: String, // 2 сыныпқа арналғаг Информатика пәнінен 4 тоқсанға арналған сабақ жоспары
    @SerializedName("download_count")
    val downloadCount: Int, // 0
    @SerializedName("group")
    val group: Group,
    @SerializedName("id")
    val id: Int, // 22
    @SerializedName("price")
    val price: Int, // 499
    @SerializedName("status")
    val status: String, // approved
    @SerializedName("subject")
    val subject: Subject,
    @SerializedName("title")
    val title: String, // сабақ жоспары, информатика пәнінен, 2 сынып
    @SerializedName("uri")
    val uri: String, // sabaq-zhospary-informatika-paninen-synyp-22
    @SerializedName("user")
    val user: String, // Оралай Болысбекқызы
    @SerializedName("view_count")
    val viewCount: Int // 45
) {
    data class ClassName(
        @SerializedName("id")
        val id: Int, // 4
        @SerializedName("name")
        val name: String // 2 сынып
    )

    data class Group(
        @SerializedName("id")
        val id: Int, // 5
        @SerializedName("name")
        val name: String // Сабақ жоспары
    )

    data class Subject(
        @SerializedName("id")
        val id: Int, // 21
        @SerializedName("name")
        val name: String // Информатика
    )
}