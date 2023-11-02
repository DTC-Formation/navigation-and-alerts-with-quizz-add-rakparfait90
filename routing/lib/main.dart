import 'package:flutter/material.dart';
import 'package:routing/myhomepage.dart';
import 'package:routing/screen1.dart';
import 'package:routing/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/screen1': (context) => const Screen1(),
        '/screen2': (context) => const Screen2(),
      },
      home: const MyHomePage(),
    );
  }
}
