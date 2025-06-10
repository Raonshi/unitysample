package com.raondev.unitysample

import android.util.Log
import com.unity3d.player.UnityPlayer
import com.unity3d.player.UnityPlayerForActivityOrService
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class UnityIpcManager : MethodCallHandler{

    /// Called by Unity
    fun onUnityMessage(message: String) {
        Log.d("Raon", "message called : $message")
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when(call.method) {
            "setRotation" -> setRotation((call.arguments as Double).toFloat())
            else -> null
        }
        result.success(null)
    }

    private fun setRotation(rotation: Float): Unit {
        UnityPlayerForActivityOrService.UnitySendMessage(
            "Cube",
            "SetRotationSpeed",
            rotation.toString()
        )
    }
}