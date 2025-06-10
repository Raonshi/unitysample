package com.raondev.unitysample

import android.util.Log
import com.unity3d.player.IUnityPlayerLifecycleEvents
import com.unity3d.player.UnityPlayerForActivityOrService
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity(), IUnityPlayerLifecycleEvents {
    lateinit var unityIpcManager: UnityIpcManager
    lateinit var unityPlayer: UnityPlayerForActivityOrService


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        unityIpcManager = UnityIpcManager()
        unityPlayer = UnityPlayerForActivityOrService(this@MainActivity, this)

        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("@unity/sample",
                UnityViewFactory(unityPlayer))
    }

    override fun onUnityPlayerUnloaded() {
        Log.d("Raon", "onUnityPlayerUnloaded")
    }



    override fun onUnityPlayerQuitted() {
        Log.d("Raon", "onUnityPlayerQuitted")
    }
}
