import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agenclean_project/constants.dart';
import 'package:agenclean_project/screens/login_screen.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController typeServiceController = TextEditingController();
  String selectedAccountType = 'Prestador de Serviço'; // Default value
  bool _isPasswordVisible = false;
  // Mascara para formato do número de telefone
  final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
  mask: '(##) #####-####',
  filter: {"#": RegExp(r'[0-9]')},
  );

  void _registerUser(BuildContext context) async {
    // Verifica se os campos obrigatórios estão vazios
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro'),
          content:
              const Text('Por favor, preencha todos os campos obrigatórios.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    try {
      if (passwordController.text != confirmPasswordController.text) {
        // Senhas não coincidem, exiba uma mensagem de erro
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Erro'),
            content: const Text('As senhas não coincidem.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
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
        // Atualize o valor do typeServiceController com o tipo de conta selecionado
        typeServiceController.text = selectedAccountType;
        String uid = userCredential.user!.uid;
        // Salve as informações adicionais no Firestore
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'uid': uid,
          'email': emailController.text,
          'fullName': fullNameController.text,
          'phone': phoneController.text,
          'typeService': typeServiceController.text,
        });

        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Sucesso'),
            content: const Text('Conta criada com sucesso!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Fechar o diálogo
                  Navigator.pop(context); // Voltar para a tela de login
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      print('Error: $e');

      if (e.code == 'email-already-in-use') {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Erro'),
            content: const Text(
                'Este email já está registrado. Por favor, use outro.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Erro inesperado: $e');
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
            style: const TextStyle(
                color: Colors.white), // Defina a cor do texto para branco
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            controller: fullNameController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Nome Completo',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          DropdownButtonFormField<String>(
            value: selectedAccountType,
            onChanged: (newValue) {
              setState(() {
                selectedAccountType = newValue!;
              });
            },
            items: <String>['Prestador de Serviço', 'Contrante']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'Tipo de conta',
              labelStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: cordeFundo1,
            ),
            dropdownColor: cordeFundo1,
          ),
          TextField(
            controller: phoneController,
            style: const TextStyle(color: Colors.white),
            inputFormatters: [phoneFormatter],
            decoration: const InputDecoration(
              labelText: 'Telefone',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            controller: passwordController,
            style: const TextStyle(
                color: Colors.white), // Defina a cor do texto para branco
            decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )),
            obscureText: true,
          ),
          TextField(
            controller: confirmPasswordController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                labelText: 'Repetir Senha',
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )),
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
                MaterialPageRoute(builder: (context) => const LoginPage()),
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
