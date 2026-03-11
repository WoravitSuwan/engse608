import 'package:flutter/material.dart';
import 'user_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController(text: "WoravitSuwan");
  final passwordController = TextEditingController(text: "FC11SSuwan");

  final formKey = GlobalKey<FormState>();

  void login() {

    if(!formKey.currentState!.validate()) return;

    if(emailController.text == "WoravitSuwan" &&
       passwordController.text == "FC11SSuwan")
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const UserListScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Container(

          width: 350,

          padding: const EdgeInsets.all(30),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black12,
              )
            ],
          ),

          child: Form(

            key: formKey,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Icon(Icons.store,size:80),

                const SizedBox(height:10),

                const Text(
                  "First Shop",
                  style: TextStyle(
                    fontSize:28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height:30),

                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),

                const SizedBox(height:15),

                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),

                const SizedBox(height:25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: login,
                    child: const Text("Sign In"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}