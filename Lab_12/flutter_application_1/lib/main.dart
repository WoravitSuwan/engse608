import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'providers/ride_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RideProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Community Carpool",
        theme: appTheme,
        home: const HomeScreen(),
      ),
    );
  }
}