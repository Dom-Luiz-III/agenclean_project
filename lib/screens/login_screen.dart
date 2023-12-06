import 'package:flutter/material.dart';
import 'package:agenclean_project/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: laranjaPrimario,
      appBar: AppBar(
        title: const Text('Agen Clean TTS'),

      ),
    );
  }
}