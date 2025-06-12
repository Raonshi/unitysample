import 'package:flutter/material.dart';
import 'package:unitysample/unity_ipc_manager.dart';
import 'package:unitysample/unity_widget.dart';

class UnityPage extends StatefulWidget {
  const UnityPage({super.key});

  @override
  State<UnityPage> createState() => _UnityPageState();
}

class _UnityPageState extends State<UnityPage> {
  late double _sliderValue;
  final UnityIpcManager _ipcManager = UnityIpcManagerImpl();

  @override
  void initState() {
    _sliderValue = 1.0;
    _ipcManager.sendMessage(_sliderValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unity Sample Page")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: UnityWidget()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Slider.adaptive(
                value: _sliderValue,
                min: 0.1,
                max: 50.0,
                onChanged: (value) {
                  _ipcManager.sendMessage(value);
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
