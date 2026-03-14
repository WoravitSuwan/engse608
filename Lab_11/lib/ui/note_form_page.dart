import 'package:flutter/material.dart';

class NoteFormPage extends StatefulWidget {
  const NoteFormPage({super.key});

  @override
  State<NoteFormPage> createState() => _NoteFormPageState();
}

class _NoteFormPageState extends State<NoteFormPage> {

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void saveNote() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("เพิ่มโน้ต 🍓"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "หัวข้อ",
                prefixIcon: const Text("🍓 "),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: contentController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "รายละเอียด",
                prefixIcon: const Text("🍉 "),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B6B),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),

              onPressed: saveNote,

              child: const Text("บันทึก 🍓"),

            ),

          ],
        ),
      ),
    );
  }
}