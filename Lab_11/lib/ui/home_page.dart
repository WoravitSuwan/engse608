import 'package:flutter/material.dart';
import 'note_form_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> notes = []; // ตัวอย่าง list โน้ต

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruit Notes 🍓"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text("🍊", style: TextStyle(fontSize: 24)),
            ),
          )
        ],
      ),

      body: notes.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "🍅",
                    style: TextStyle(fontSize: 90),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "ยังไม่มีโน้ต",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "เริ่มปลูกความคิดกันเลย 🌱",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )

          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {

                final note = notes[index];

                return Card(
                  color: const Color(0xFFFFE5EC),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: ListTile(
                    leading: const Text(
                      "🍓",
                      style: TextStyle(fontSize: 22),
                    ),

                    title: Text(note["title"] ?? ""),
                    subtitle: Text(note["content"] ?? ""),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const NoteFormPage(),
            ),
          );
        },
      ),
    );
  }
}