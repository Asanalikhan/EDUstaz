package com.example.edustaz.ui.screen.olympiad

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.edustaz.data.model.OlympiadListResponseItem
import com.example.edustaz.data.remote.NetworkResponse
import com.example.edustaz.data.remote.RetrofitClient
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class OlympiadViewModel : ViewModel() {

    val apiService = RetrofitClient.apiService

    private val _olympiadResponse =
        MutableLiveData<NetworkResponse<List<OlympiadListResponseItem>>>()
    val olympiadResponse: LiveData<NetworkResponse<List<OlympiadListResponseItem>>> =
        _olympiadResponse

    fun getList(token: String) {
        viewModelScope.launch(Dispatchers.IO) {
            _olympiadResponse.postValue(NetworkResponse.Loading)
            try {
                val response = apiService.getOlympiadList(token)
                if (response.isSuccessful) {
                    response.body()?.let {
                        _olympiadResponse.postValue(NetworkResponse.Success(it))
                    } ?: run {
                        _olympiadResponse.postValue(NetworkResponse.Error("Empty response!"))
                    }
                } else {
                    _olympiadResponse.postValue(NetworkResponse.Error("Request failed: ${response.code()}"))
                }
            } catch (e: Exception) {
                _olympiadResponse.postValue(NetworkResponse.Error("Error: ${e.message}"))
            }
        }
    }
}