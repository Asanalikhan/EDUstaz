package com.example.edustaz.ui.screen.profile

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.edustaz.data.model.ProfileResponse
import com.example.edustaz.data.model.ProfileUpdateRequest
import com.example.edustaz.data.remote.NetworkResponse
import com.example.edustaz.data.remote.RetrofitClient
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class ProfileViewModel : ViewModel() {
    val apiService = RetrofitClient.apiService

    private val _profileResponse = MutableLiveData<NetworkResponse<ProfileResponse>>()
    val profileResponse: LiveData<NetworkResponse<ProfileResponse>> = _profileResponse

    fun getProfileData(token: String) {
        viewModelScope.launch(Dispatchers.IO) {
            _profileResponse.postValue(NetworkResponse.Loading)
            try {
                val response = apiService.getProfile("Bearer $token")
                Log.d("ProfileViewModel", response.body().toString())
                if (response.isSuccessful) {
                    response.body()?.let {
                        _profileResponse.postValue(NetworkResponse.Success(it))
                        Log.d("ProfileViewModel", response.body().toString())
                    } ?: run {
                        _profileResponse.postValue(NetworkResponse.Error("Empty body"))
                    }
                } else {
                    _profileResponse.postValue(NetworkResponse.Error(response.message()))
                    Log.d("ProfileViewModel", token)
                }
            } catch (e: Exception) {
                _profileResponse.postValue(NetworkResponse.Error("${e.message}"))
            }
        }
    }

    fun putProfileData(token: String, profile: ProfileUpdateRequest) {
        viewModelScope.launch(Dispatchers.IO) {
            _profileResponse.postValue(NetworkResponse.Loading)
            try {
                val response = apiService.patchProfile(token, profile)
                if (response.isSuccessful) {
                    response.body()?.let {
                        _profileResponse.postValue(NetworkResponse.Success(it))
                    } ?: run {
                        _profileResponse.postValue(NetworkResponse.Error("Empty body"))
                    }
                } else {
                    _profileResponse.postValue(NetworkResponse.Error(response.message()))
                }
            } catch (e: Exception) {
                _profileResponse.postValue(NetworkResponse.Error("${e.message}"))
            }
        }
    }
}