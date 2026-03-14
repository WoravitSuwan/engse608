import 'package:flutter/material.dart';
import 'ui/home_page.dart';

void main() {
  runApp(const FruitNotesApp());
}

class FruitNotesApp extends StatelessWidget {
  const FruitNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fruit Notes 🍓",

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF3E8),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF6B6B),
          centerTitle: true,
        ),

        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFF6B6B),
        ),
      ),

      home: const HomePage(),
    );
  }
}