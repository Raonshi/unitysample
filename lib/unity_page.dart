import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const String viewType = "@unity/sample";

class UnityPage extends StatelessWidget {
  const UnityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Unity Sample Page"),
      ),
      body: switch (defaultTargetPlatform) {
        TargetPlatform.android => AndroidView(viewType: viewType),
        TargetPlatform.iOS => UiKitView(viewType: viewType),
        _ => throw UnsupportedError(
          "Unsupported platform: $defaultTargetPlatform",
        ),
      },
    );
  }
}
