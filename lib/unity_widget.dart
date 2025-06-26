import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:unitysample/unity_channel.dart';

class UnityWidget extends StatefulWidget {
  const UnityWidget({super.key, required this.onPlatformViewCreated});

  final ValueChanged<int> onPlatformViewCreated;

  @override
  State<UnityWidget> createState() => _UnityWidgetState();
}

class _UnityWidgetState extends State<UnityWidget> {
  @override
  void initState() {
    super.initState();
    log("UnityWidget initState");
  }

  @override
  void dispose() {
    super.dispose();
    log("UnityWidget dispose");
  }

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => AndroidView(
        viewType: UnityChannel.view.channelName,
        gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        layoutDirection: TextDirection.ltr,
        creationParams: {},
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: widget.onPlatformViewCreated,
      ),
      TargetPlatform.iOS => UiKitView(
        viewType: UnityChannel.view.channelName,
        layoutDirection: TextDirection.ltr,
        creationParams: {},
        creationParamsCodec: const StandardMessageCodec(),
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{},
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        onPlatformViewCreated: widget.onPlatformViewCreated,
      ),
      _ => throw UnsupportedError(
        'Unsupported platform: $defaultTargetPlatform',
      ),
    };
  }
}
