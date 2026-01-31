import 'package:flutter/material.dart';
import 'package:fooderlich/%E0%B9%89home.dart';
import 'package:fooderlich/fooderlich_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FooderlichTheme.light(),
      home: const Home(),
    );
  }
}


