import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unitysample/unity_ipc_manager.dart';
import 'package:unitysample/unity_widget.dart';

class UnityPage extends StatelessWidget {
  const UnityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unity Sample Page")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: UnityWidget(
                onPlatformViewCreated: (id) {
                  log("UnityWidget created with id: $id");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const RotationSlider(),
            ),
          ],
        ),
      ),
    );
  }
}

class RotationSlider extends StatefulWidget {
  const RotationSlider({super.key});

  @override
  State<RotationSlider> createState() => _RotationSliderState();
}

class _RotationSliderState extends State<RotationSlider> {
  late final UnityIpcManager _ipcManager;
  late double _sliderValue;

  @override
  void initState() {
    _ipcManager = UnityIpcManagerImpl();
    _sliderValue = 1.0;
    _ipcManager.sendMessage(_sliderValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slider.adaptive(
      value: _sliderValue,
      min: 0.1,
      max: 50.0,
      onChanged: (value) {
        setState(() {
          _sliderValue = value;
        });

        _ipcManager.sendMessage(value);
      },
    );
  }
}
