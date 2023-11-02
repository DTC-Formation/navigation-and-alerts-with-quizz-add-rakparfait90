import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Screen',
          style: TextStyle(color: Colors.white),
        ),
        leading: null,
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/screen1');
          },
          icon: const Icon(
            Icons.settings,
            size: 32,
          ),
        ),
      ),
    );
  }
}
