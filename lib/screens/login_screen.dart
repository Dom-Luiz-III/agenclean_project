import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agenclean_project/constants.dart';
import 'package:agenclean_project/screens/register_screen.dart';
import '/screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _loginUser(BuildContext context) async {
    try {
      print('Email: ${emailController.text.trim()}');
      print('Password: ${passwordController.text}');
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInPage(
        emailController: emailController,
        passwordController: passwordController,
        loginUser: _loginUser,
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(BuildContext) loginUser;

  const SignInPage({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.loginUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: cordeFundo1,
      body: Center(
        child: isSmallScreen
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _Logo(),
                  _FormContent(
                    emailController: emailController,
                    passwordController: passwordController,
                    loginUser: loginUser,
                  )
                ],
              )
            : Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 800),
                child: Row(
                  children: [
                    const Expanded(child: _Logo()),
                    Expanded(
                      child: Center(
                        child: _FormContent(
                          emailController: emailController,
                          passwordController: passwordController,
                          loginUser: loginUser,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: 0.7,
          child: logoImage,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Entre com a sua conta",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white)
                : Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(BuildContext) loginUser;

  const _FormContent({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.loginUser,
  }) : super(key: key);

  @override
  _FormContentState createState() => _FormContentState();
}

class _FormContentState extends State<_FormContent> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Preencha este campo';
                }
                if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
                    .hasMatch(value)) {
                  return 'Por favor, coloque um email válido';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Digite seu email',
                prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              controller: widget.emailController,
            ),
            _gap(),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Preencha este campo';
                }

                if (value.length < 6) {
                  return 'A senha deve ter no mínimo 6 caracteres';
                }
                return null;
              },
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Coloque a sua senha',
                prefixIcon:
                    const Icon(Icons.lock_outline_rounded, color: Colors.white),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: const TextStyle(color: Colors.white),
                hintStyle: const TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              style: const TextStyle(color: Colors.white),
              controller: widget.passwordController,
            ),
            _gap(),
            CheckboxListTile(
              value: _rememberMe,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _rememberMe = value;
                });
              },
              title: const Text('Lembrar senha',
                  style: TextStyle(color: Colors.white)),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              contentPadding: const EdgeInsets.all(0),
              activeColor: laranjaPrimario,
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: laranjaPrimario, // Cor da caixa
                  foregroundColor: corBranca, // Cor do texto
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    widget.loginUser(context);
                  }
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterPage()));
              },
              child: Text(
                'Realizar Cadastro',
                style: TextStyle(color: laranjaPrimario),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
