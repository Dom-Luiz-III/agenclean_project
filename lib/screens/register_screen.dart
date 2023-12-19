import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agenclean_project/constants.dart';

import '/screens/login_screen.dart';
import '/screens/forget_password.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _registerUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cordeFundo1,
      appBar: AppBar(
        backgroundColor: corMaisEscura,
        automaticallyImplyLeading: false,
        title: const Text('Registrar Conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white), // Defina a cor do texto para branco
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            TextField(
              controller: passwordController,
              style: TextStyle(color: Colors.white), // Defina a cor do texto para branco
              decoration: const InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: laranjaPrimario,
                foregroundColor: corBranca,
              ),
              onPressed: () => _registerUser(context),
              child: const Text('Registrar'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text(
                'Você possui uma conta? Clique aqui',
                style: TextStyle(color: Color.fromARGB(255, 241, 109, 0)),
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
                );
              },
              child: const Text(
                'Esqueceu sua senha?',
                style: TextStyle(color: Color.fromARGB(255, 241, 109, 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
