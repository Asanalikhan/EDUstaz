package com.example.edustaz.data.remote

import android.content.Context
import android.content.SharedPreferences
import androidx.core.content.edit

class PreferencesManager(context: Context) {

    private val sharedPreferences: SharedPreferences =
        context.getSharedPreferences("app_preferences", Context.MODE_PRIVATE)

    fun saveString(key: String, value: String) {
        sharedPreferences.edit { putString(key, value) }
    }

    fun getString(key: String): String {
        return sharedPreferences.getString(key, "") ?: ""
    }

    fun removeString(key: String) {
        sharedPreferences.edit { removeString(key) }
    }
}