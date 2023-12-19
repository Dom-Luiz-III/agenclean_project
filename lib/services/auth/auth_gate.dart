import 'package:agenclean_project/pages/home_page.dart';
import 'package:agenclean_project/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user is logged in
        if (snapshot.hasData) {
          return const HomePage();
        }
        //user is NOT logged in
        else {
          return const LoginOrRegister();
        }
      },
    ));
  }
}
