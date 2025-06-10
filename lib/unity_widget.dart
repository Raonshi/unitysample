import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:unitysample/unity_channel.dart';

class UnityWidget extends StatelessWidget {
  const UnityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: UnityChannel.view.channelName,
      surfaceFactory:
          (BuildContext context, PlatformViewController controller) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers:
                  const <Factory<OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
      onCreatePlatformView: (PlatformViewCreationParams params) {
        final controller = PlatformViewsService.initExpensiveAndroidView(
          id: params.id,
          viewType: UnityChannel.view.channelName,
          layoutDirection: TextDirection.ltr,
          creationParams: {},
          creationParamsCodec: const StandardMessageCodec(),
          onFocus: () => params.onFocusChanged(true),
        );

        controller
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
        return controller;
      },
    );
  }
}
