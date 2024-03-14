import 'package:flutter/material.dart';
import './widgets/navigation_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: BottomNavigationScreen(),
    );
  }
}
