package com.example.edustaz.ui.screen.auth

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.edustaz.data.model.LoginRequest
import com.example.edustaz.data.model.LoginResponse
import com.example.edustaz.data.remote.NetworkResponse
import com.example.edustaz.data.remote.RetrofitClient
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class AuthViewModel : ViewModel() {

    private val apiService = RetrofitClient.apiService

    private val _loginResponse = MutableLiveData<NetworkResponse<LoginResponse>>()
    val loginResponse: LiveData<NetworkResponse<LoginResponse>> = _loginResponse

    fun login(loginRequest: LoginRequest) {
        viewModelScope.launch(Dispatchers.IO) {
            _loginResponse.postValue(NetworkResponse.Loading)
            try {
                val response = apiService.login(loginRequest)
                if (response.isSuccessful) {
                    response.body()?.let {
                        _loginResponse.postValue(NetworkResponse.Success(it))
                    } ?: run {
                        _loginResponse.postValue(NetworkResponse.Error("Empty response"))
                    }
                } else {
                    _loginResponse.postValue(NetworkResponse.Error("Login failed: ${response.code()}"))
                }
            } catch (e: Exception) {
                _loginResponse.postValue(NetworkResponse.Error("$e"))
            }
        }
    }
}