import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Screen 2',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const Text('Rakoto'),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            },
            child: const Text("Retour à l'accueil"),
          ),
        ],
      ),
    );
  }
}
