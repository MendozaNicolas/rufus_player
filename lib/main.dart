import 'package:flutter/material.dart';
import 'package:rufus_player/views/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF009688),
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF009688),
          title: const Text(
            'Rufus',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: const Home(),
      ),
    );
  }
}
