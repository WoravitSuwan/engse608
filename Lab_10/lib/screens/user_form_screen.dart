import 'package:flutter/material.dart';

class UserFormScreen extends StatelessWidget {

  const UserFormScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add User"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              decoration: const InputDecoration(
                labelText: "First Name",
              ),
            ),

            const SizedBox(height:15),

            TextField(
              decoration: const InputDecoration(
                labelText: "Last Name",
              ),
            ),

            const SizedBox(height:15),

            TextField(
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),

            const SizedBox(height:25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("Save User"),
              ),
            )
          ],
        ),
      ),
    );
  }
}