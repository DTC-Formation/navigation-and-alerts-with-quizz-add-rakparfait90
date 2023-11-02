import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Screen 1',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const Text('Rakoto'),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (BuildContext ctx) {
              //   return const Screen2();
              // }));
              Navigator.of(context).pushNamed('/screen2');
            },
            child: const Text('Aller Screen 2'),
          ),
        ],
      ),
    );
  }
}
