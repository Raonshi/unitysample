package com.raondev.unitysample

import android.util.Log

class UnityIpcManager {

    /// Called by Unity
    fun onUnityMessage(message: String) {
        Log.d("Raon", "message called : $message")
    }
}