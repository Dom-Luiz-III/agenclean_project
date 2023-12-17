import 'package:agenclean_project/screens/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:agenclean_project/screens/profile_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}