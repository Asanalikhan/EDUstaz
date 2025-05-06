package com.example.edustaz.data.remote

import com.example.edustaz.data.model.FilterResponse
import com.example.edustaz.data.model.LoginRequest
import com.example.edustaz.data.model.LoginResponse
import com.example.edustaz.data.model.MaterialResponse
import com.example.edustaz.data.model.MaterialsResponse
import com.example.edustaz.data.model.OlympiadListResponseItem
import com.example.edustaz.data.model.ProfileResponse
import com.example.edustaz.data.model.ProfileUpdateRequest
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.http.PATCH
import retrofit2.http.POST
import retrofit2.http.Path

interface ApiService {

    @POST("user/signin")
    suspend fun login(
        @Body body: LoginRequest
    ): Response<LoginResponse>

    @GET("competitions/competitions/")
    suspend fun getOlympiadList(
        @Header("Authorization") token: String
    ): Response<List<OlympiadListResponseItem>>

    @GET("materials/filter/")
    suspend fun getFilter(
        @Header("Authorization") token: String
    ): Response<FilterResponse>

    @GET("materials/materials/")
    suspend fun getMaterials(
        @Header("Authorization") token: String
    ): Response<MaterialsResponse>

    @GET("materials/materials/{id}")
    suspend fun getMatarialById(
        @Header("Authorization") token: String,
        @Path("id") id: Int
    ): Response<MaterialResponse>

    @GET("user/profile")
    suspend fun getProfile(
        @Header("Authorization") token: String
    ): Response<ProfileResponse>

    @PATCH("user/profile")
    suspend fun patchProfile(
        @Header("Authorization") token: String,
        @Body profileData: ProfileUpdateRequest
    ): Response<ProfileResponse>

}