package com.raondev.unitysample

import android.content.Context
import com.unity3d.player.UnityPlayer
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class UnityViewFactory(
    private val player: UnityPlayer,
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        requireNotNull(context)
        return UnityView(player.context, player)
    }
}