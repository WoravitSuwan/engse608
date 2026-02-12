import 'package:flutter/material.dart';
import 'home_page.dart';
import 'pages/actions_page.dart';
import 'pages/communication_page.dart';
import 'pages/containment_page.dart';
import 'pages/navigation_page.dart';
import 'pages/selection_page.dart';
import 'pages/textinput_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Widgets Demo',
theme: ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xfff4f2ef),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff3a5a40),
    brightness: Brightness.light,
  ),
  cardTheme: CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  ),
),


      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/actions': (context) => const ActionsPage(),
        '/communication': (context) => const CommunicationPage(),
        '/containment': (context) => const ContainmentPage(),
        '/navigation': (context) => const NavigationPageDemo(),
        '/selection': (context) => const SelectionPage(),
        '/textinput': (context) => const TextInputPage(),
      },
    );
    
  }
  
}
