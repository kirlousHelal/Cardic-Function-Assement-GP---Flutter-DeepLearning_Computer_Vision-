// main.dart
import 'package:cardic_function_assement_2/start_flash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: const StartFlashScreen(),
      // home: FinalResultsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
