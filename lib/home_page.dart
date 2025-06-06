import 'package:flutter/material.dart';
import 'package:unitysample/unity_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Column(
        children: [
          Text("Hello, World!"),
          ElevatedButton(
            onPressed: () => _goToUnity(context),
            child: Text("Go to unity"),
          ),
        ],
      ),
    );
  }

  void _goToUnity(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UnityPage()),
    );
  }
}
