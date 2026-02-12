import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selection"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text("Enable Notifications"),
            value: notifications,
            onChanged: (val) => setState(() => notifications = val),
          ),
        ),
      ),
    );
  }
}
