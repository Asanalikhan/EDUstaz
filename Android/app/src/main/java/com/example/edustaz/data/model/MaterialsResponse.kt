package com.example.edustaz.data.model


import com.google.gson.annotations.SerializedName

data class MaterialsResponse(
    @SerializedName("count")
    val count: Int, // 10
    @SerializedName("next")
    val next: Any, // null
    @SerializedName("previous")
    val previous: Any, // null
    @SerializedName("results")
    val results: List<Result>
) {
    data class Result(
        @SerializedName("access")
        val access: Boolean, // false
        @SerializedName("approved_at")
        val approvedAt: Any, // null
        @SerializedName("class_name")
        val className: ClassName,
        @SerializedName("created_at")
        val createdAt: String, // 2025-04-07T06:17:00.818967+05:00
        @SerializedName("description")
        val description: String, // Қысқаша түсінік
        @SerializedName("download_count")
        val downloadCount: Int, // 0
        @SerializedName("group")
        val group: Group,
        @SerializedName("id")
        val id: Int, // 9
        @SerializedName("price")
        val price: Int, // 499
        @SerializedName("status")
        val status: String, // approved
        @SerializedName("subject")
        val subject: Subject,
        @SerializedName("title")
        val title: String, // Тестілеу үшін қолданушы атынан жарияланған материал
        @SerializedName("uri")
        val uri: String, // testileu-ushin-qoldanushy-atynan-zhariyalangan-material-9
        @SerializedName("user")
        val user: String, // Нурда 
        @SerializedName("view_count")
        val viewCount: Int // 16
    ) {
        data class ClassName(
            @SerializedName("id")
            val id: Int, // 6
            @SerializedName("name")
            val name: String // 4 сынып
        )

        data class Group(
            @SerializedName("id")
            val id: Int, // 3
            @SerializedName("name")
            val name: String // Ашық сабақ
        )

        data class Subject(
            @SerializedName("id")
            val id: Int, // 3
            @SerializedName("name")
            val name: String // Алғашқы әскери дайындық
        )
    }
}