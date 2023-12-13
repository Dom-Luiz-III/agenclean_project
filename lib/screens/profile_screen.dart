import 'package:agenclean_project/constants.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 80),
          decoration: BoxDecoration(
            color: azulPrimario,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(width: 10),
                const Expanded(
                  child: SizedBox(
                    height: 55,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          /*FirebaseAuth.instance.currentUser!.displayName ??*/ 'Nome do Usuário',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        // Adicione outros elementos de texto conforme necessário
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String userDescription =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.";

    return Scaffold(
      backgroundColor: cordeFundo1,
      body: Column(
        children: [
          const Expanded(flex: 1, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  // texto da descrição
                  Container(
                    constraints: const BoxConstraints(maxWidth: 450),
                    child: const Text(
                      userDescription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // "botões de habilidades", "editar perfil" e "extra"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _customFloatingActionButton(
                        onPressed: () {},
                        heroTag: 'abilities',
                        label: "Habilidades",
                        backgroundColor: azulSecundario, // Cor do botão
                      ),
                      const SizedBox(
                          width: 10.0), // espaçamento entre os botões
                      _customFloatingActionButton(
                        onPressed: () {},
                        heroTag: 'edit',
                        label: "Editar Perfil",
                        backgroundColor: azulPrimario, // Cor do botão
                      ),
                      const SizedBox(
                          width: 10.0), // espaçamento entre os botões
                      _customCircularButton(
                        onPressed: () {},
                        icon: Icons.more_horiz,
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// costumizador para botões de "habilidades" e "editar perfil"
Widget _customFloatingActionButton({
  required VoidCallback onPressed,
  required String heroTag,
  required String label,
  required Color backgroundColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
    child: SizedBox(
      width: 120,
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Curvatura das bordas
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ),
    ),
  );
}

// customizador para o botão circular
Widget _customCircularButton({
  required VoidCallback onPressed,
  required IconData icon,
  required Color backgroundColor,
}) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.white,
        width: 2.0,
      ),
    ),
    child: Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    ),
  );
}
