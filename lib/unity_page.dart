import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

const String viewType = "@unity/sample";

class UnityPage extends StatelessWidget {
  const UnityPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: true,
    //     title: Text("Unity Sample Page"),
    //   ),
    //   body: switch (defaultTargetPlatform) {
    //     TargetPlatform.android => AndroidView(
    //       viewType: viewType,
    //       layoutDirection: TextDirection.ltr,
    //       creationParamsCodec: StandardMessageCodec(),
    //     ),
    //     TargetPlatform.iOS => UiKitView(viewType: viewType),
    //     _ => throw UnsupportedError(
    //       "Unsupported platform: $defaultTargetPlatform",
    //     ),
    //   },
    // );
    return Scaffold(
      appBar: AppBar(title: Text("Unity Sample Page")),
      body: PlatformViewLink(
        viewType: viewType,
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
            viewType: viewType,
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
      ),
    );
  }
}
