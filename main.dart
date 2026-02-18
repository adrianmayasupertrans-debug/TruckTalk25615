import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TruckTalkApp());
}

class TruckTalkApp extends StatelessWidget {
  const TruckTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TruckTalk',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
