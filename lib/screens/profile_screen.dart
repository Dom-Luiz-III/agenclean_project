import 'package:agenclean_project/constants.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

//Deixei o TopPortion como público só pra testar a home
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
            color: cordeFundo2,
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
                          /*FirebaseAuth.instance.currentUser!.displayName ??*/ 'Paula Ferreira Silva',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
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

// corpo do perfil
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String userDescription =
        "Valores padrão da diária: \$90,00 a \$150,00.\n\nAlteração do valor a depender do tamanho da residência.\n\nTaxa de transporte deve ser pago a parte";

    return Scaffold(
      backgroundColor: cordeFundo1,
      body: Column(
        children: [
          const Expanded(flex: 1, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
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
                          backgroundColor: azulSecundario,
                        ),
                        const SizedBox(width: 0.5), // Reduzi o espaçamento aqui
                        _customFloatingActionButton(
                          onPressed: () {},
                          heroTag: 'edit',
                          label: "Editar Perfil",
                          backgroundColor: azulPrimario,
                        ),
                        const SizedBox(width: 0.5), // Reduzi o espaçamento aqui
                        _customCircularButton(
                          onPressed: () {},
                          icon: Icons.more_horiz,
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    // Linha divisoria
                    const SizedBox(height: 15),
                    Divider(
                      color: cordeFundo2,
                      thickness: 4.0,
                      indent: 0, // Espaçamento à esquerda do Divider
                      endIndent: 0, // Espaçamento à direita do Divider
                    ),
                    // Área de competências
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Competências",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text("Serviços: Diarista, Cozinheira, Cuidadora",
                                style: TextStyle(color: Colors.white)),
                            Text("Trabalha como diarista há: 8 anos",
                                style: TextStyle(color: Colors.white)),
                            Text("Disponível para trabalhar em: Tempo Integral",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Linha divisoria
                    Divider(
                      color: cordeFundo2,
                      thickness: 4.0,
                      indent: 0, // Espaçamento à esquerda do Divider
                      endIndent: 0, // Espaçamento à direita do Divider
                    ),
                    const SizedBox(height: 20),
                    // Área de Informações
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Informações",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "50 anos",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Queimadinha\nFeira de Santana / BA",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "+ 50 Serviços Prestados",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Linha divisoria
                    Divider(
                      color: cordeFundo2,
                      thickness: 4.0,
                      indent: 0, // Espaçamento à esquerda do Divider
                      endIndent: 0, // Espaçamento à direita do Divider
                    ),
                    // Área de Recomendação
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Área de Recomendações',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _buildRecommendationBox(
                            name: 'Marcos Augusto', // '$name'
                            rating: '4.5/5.0', // '$rating'
                            ratingDescription:
                                'Muito boa cozinheira, faz uma limpeza incrível, RECOMENDO!', // '$ratingDescription'
                          ),
                          const SizedBox(height: 10),
                          _buildRecommendationBox(
                            name: 'Ana Silva',
                            rating: '5.0/5.0',
                            ratingDescription:
                                'Excelente profissional, sempre pontual e prestativa.',
                          ),
                          const SizedBox(height: 10),
                          _buildRecommendationBox(
                            name: 'Júlia Santos',
                            rating: '4.8/5.0',
                            ratingDescription:
                                'Ótima diarista, realiza um trabalho impecável.',
                          ),
                          const SizedBox(height: 10),
                          _buildRecommendationBox(
                            name: 'Carlos Oliveira',
                            rating: '4.2/5.0',
                            ratingDescription:
                                'Cuidadora dedicada e atenciosa. Recomendo seus serviços.',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// função de costumizador para botões de "habilidades" e "editar perfil"
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

// função de customizador para o botão circular
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

// função para área de recomendação
Widget _buildRecommendationBox({
  required String name,
  required String rating,
  required String ratingDescription,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Nota: $rating',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          ratingDescription,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
