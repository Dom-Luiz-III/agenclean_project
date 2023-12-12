// import 'package:flutter/material.dart';
// import 'package:agenclean_project/constants.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: const RegisterInPage(),
//     );
//   }
// }

// class RegisterInPage extends StatelessWidget {
//   const RegisterInPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

//     return Scaffold(
//         backgroundColor: corEscura,
//         body: Center(
//             child: isSmallScreen
//                 ? const Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       _Logo(),
//                       _FormContent(),
//                     ],
//                   )
//                 : Container(
//                     padding: const EdgeInsets.all(32.0),
//                     constraints: const BoxConstraints(maxWidth: 800),
//                     child: const Row(
//                       children: [
//                         Expanded(child: _Logo()),
//                         Expanded(
//                           child: Center(child: _FormContent()),
//                         ),
//                       ],
//                     ),
//                   )));
//   }
// }

// class _Logo extends StatelessWidget {
//   const _Logo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Transform.scale(
//           scale: 0.7,
//           child: logoImage,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             "Entre com a sua conta",
//             textAlign: TextAlign.center,
//             style: isSmallScreen
//             ? Theme.of(context)
//                 .textTheme
//                 .headlineSmall
//                 ?.copyWith(color: Colors.white),
//           ),
//         )
//       ],
//     );
//   }
// }

// class _FormContent extends 
