import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agenclean_project/constants.dart';

import '/screens/login_screen.dart';
import '/screens/forget_password.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool accountCreated = false;

  void _registerUser(BuildContext context) async {
    try {
      if (passwordController.text != confirmPasswordController.text) {
        // Senhas não coincidem, exiba uma mensagem de erro
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Erro'),
            content: Text('As senhas não coincidem.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        // Salve as informações adicionais no Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .set({
          'uid': uid,
          'email': emailController.text,
          'fullName': fullNameController.text,
          'phone': phoneController.text,
        });
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Sucesso'),
            content: Text('Conta criada com sucesso!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Fechar o diálogo
                  Navigator.pop(context); // Voltar para a tela de login
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
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
        title: const Text('Registrar Conta',
            style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Campos para preencher
          TextField(
            controller: emailController,
            style: TextStyle(
                color: Colors.white), // Defina a cor do texto para branco
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            controller: fullNameController,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Nome Completo',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            controller: phoneController,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Telefone',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            controller: passwordController,
            style: TextStyle(
                color: Colors.white), // Defina a cor do texto para branco
            decoration: const InputDecoration(
              labelText: 'Senha',
              labelStyle: TextStyle(color: Colors.white),
            ),
            obscureText: true,
          ),
          TextField(
            controller: confirmPasswordController,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Repetir Senha',
              labelStyle: TextStyle(color: Colors.white),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 50.0),
          // Botão de Registrar
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: laranjaPrimario,
              foregroundColor: corBranca,
            ),
            onPressed: () => _registerUser(context),
            child: const Text('Criar Conta'),
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
              'Já possui uma conta? Clique aqui',
              style: TextStyle(color: Color.fromARGB(255, 241, 109, 0)),
            ),
          ),
        ],
      ),
    );
  }
}
