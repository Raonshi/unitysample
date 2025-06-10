package com.raondev.unitysample

import android.util.Log
import com.unity3d.player.IUnityPlayerLifecycleEvents
import com.unity3d.player.UnityPlayerForActivityOrService
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity(), IUnityPlayerLifecycleEvents {
    val unityIpcManager = UnityIpcManager()
    lateinit var unityPlayer: UnityPlayerForActivityOrService
    lateinit var ipcChannel:MethodChannel


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        ipcChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            UnityChannel.ipc.channelName)
        ipcChannel.setMethodCallHandler(unityIpcManager)

        unityPlayer = UnityPlayerForActivityOrService(this@MainActivity, this)

        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(UnityChannel.view.channelName,
                UnityViewFactory(unityPlayer))
    }

    override fun onUnityPlayerUnloaded() {
        Log.d("Raon", "onUnityPlayerUnloaded")
    }



    override fun onUnityPlayerQuitted() {
        Log.d("Raon", "onUnityPlayerQuitted")
    }
}
