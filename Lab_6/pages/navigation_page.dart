import 'package:flutter/material.dart';

class NavigationPageDemo extends StatefulWidget {
  const NavigationPageDemo({super.key});

  @override
  State<NavigationPageDemo> createState() => _NavigationPageDemoState();
}

class _NavigationPageDemoState extends State<NavigationPageDemo> {
  int index = 0;

  final pages = const [
    Center(child: Icon(Icons.home, size: 80)),
    Center(child: Icon(Icons.person, size: 80)),
    Center(child: Icon(Icons.settings, size: 80)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
        centerTitle: true,
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
          NavigationDestination(icon: Icon(Icons.person_outline), label: "Profile"),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
    );
  }
}
