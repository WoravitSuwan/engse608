import 'package:flutter/material.dart';
import 'user_form_screen.dart';
import 'login_screen.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("First Shop Users"),

        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginScreen(),
                ),
              );
            },
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const UserFormScreen(),
            ),
          );
        },
      ),

      body: ListView(

        padding: const EdgeInsets.all(16),

        children: const [

          UserCard(
            name: "John Smith",
            email: "john@example.com",
          ),

          UserCard(
            name: "Jane Doe",
            email: "jane@example.com",
          ),

        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {

  final String name;
  final String email;

  const UserCard({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: ListTile(

        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),

        title: Text(name),

        subtitle: Text(email),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.edit),
            SizedBox(width:10),
            Icon(Icons.delete,color:Colors.red),
          ],
        ),
      ),
    );
  }
}