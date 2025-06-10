package com.raondev.unitysample

import android.content.Context
import android.graphics.Color
import android.util.Log
import android.view.View
import android.widget.TextView
import com.unity3d.player.UnityPlayer
import io.flutter.plugin.platform.PlatformView

class UnityView(
    private val context: Context,
    private val player: UnityPlayer,
) : PlatformView {
    init {
        player.onResume()
        player.frameLayout.requestFocus()
        player.windowFocusChanged(true)

    }

    override fun getView(): View {
        return player.frameLayout
    }

    override fun dispose() {
        player.windowFocusChanged(false)
        player.onPause()
    }
}