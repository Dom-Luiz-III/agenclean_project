import 'package:flutter/material.dart';
import 'package:agenclean_project/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:agenclean_project/screens/login_screen.dart';
import 'package:agenclean_project/screens/settings_page.dart';
import 'package:agenclean_project/screens/profile_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _GoogleBottomBarState();
}

class _GoogleBottomBarState extends State<Home> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Aqui ficará o painel que aparece após clicar nos botões de Pesquisar, Chat e etc. Isso é apenas uma versão inicial
  final List<Widget> _pageWidgets = [
    // Conteúdo para o item "Inicio"
    Center(
      child: Text("Página Inicial test"),
    ),
    // Conteúdo para o item "Pesquisar"
    Center(
      child: Text("Pesquisar test"),
    ),
    // Conteúdo para o item "Adicionar"
    Center(
      child: Text("Adicionar test"),
    ),
    // Conteúdo para o item "Chat"
    Center(
      child: Text("Chat test"),
    ),
    // Conteúdo para o item "Perfil"
    Center(
      child: Text("Perfil test"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: cordeFundo1,
      appBar: AppBar(
        title: const Text(
          'AGENCLEAN contratante',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF22272B),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
          ),
        ],
      ),
      endDrawer: _drawer(), // Abre o menu na lateral direita
      body: _pageWidgets[
          _selectedIndex], // Mostra o conteúdo correspondente ao item selecionado

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: _navBarItems,
        backgroundColor: Colors.orange[900],
      ),
    );
  }

  //Widget onde mostra o menu de opções na direita da tela home e o que ele faz após clicar
  Widget _drawer() => Drawer(
        child: ListView(
          children: <Widget>[
            Column(
              children: _menuItems.map((item) {
                IconData iconData = Icons.person;
                if (item == 'Favoritos') {
                  iconData = Icons.favorite;
                  return ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                      // Lógica para lidar com a ação do item "Favoritos"
                      print('test Favoritos');
                    },
                    leading: Icon(iconData),
                    title: Text(item),
                  );
                } else if (item == 'Trocar conta') {
                  iconData = Icons.switch_account;
                  return ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                      // Lógica para lidar com a ação do item "Favoritos"
                      print('test Favoritos');
                    },
                    leading: Icon(iconData),
                    title: Text(item),
                  );
                } else if (item == 'Perfil') {
                  iconData = Icons.switch_account;
                  return ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                      // Lógica para lidar com a ação do item "Perfil"
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const _TopPortion()),
                      // );
                    },
                    leading: Icon(iconData),
                    title: Text(item),
                  );
                } else if (item == 'Configurações') {
                  iconData = Icons.settings;
                  return ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                      // Lógica para lidar com a ação do item "Configurações"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaginaConfiguracoes()),
                      );
                    },
                    leading: Icon(iconData),
                    title: Text(item),
                  );
                } else if (item == 'Sair') {
                  iconData = Icons.exit_to_app;
                  return ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                      // Navegar para a tela de login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    leading: Icon(iconData),
                    title: Text(item),
                  );
                }

                return ListTile(
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  leading: Icon(iconData),
                  title: Text(item),
                );
              }).toList(),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                // Lógica para lidar com a ação do item "Suporte e Termos de Uso"
                print('test Suporte e Termos de Uso');
              },
              leading: const Icon(Icons.help),
              title: const Text("Suporte e Termos de Uso"),
            ),
            ListTile(
              onTap: () {
                // Lógica para lidar com a ação do item "Sobre Nós"
                print('test Sobre Nós');
              },
              leading: const Icon(Icons.info),
              title: const Text("Sobre Nós"),
            ),
          ],
        ),
      );

  final _navBarItems = [
    SalomonBottomBarItem(
      icon: const Icon(Icons.home),
      title: const Text("Inicio"),
      selectedColor: Colors.blue[50],
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.search),
      title: const Text("Pesquisar"),
      selectedColor: Colors.blue[50],
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.add_circle_outlined),
      title: const Text("Adicionar"),
      selectedColor: Colors.blue[50],
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.chat),
      title: const Text("Chat"),
      selectedColor: Colors.blue[50],
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.person),
      title: const Text("Perfil"),
      selectedColor: Colors.blue[50],
    ),
  ];

  final List<String> _menuItems = <String>[
    'Perfil',
    'Favoritos',
    'Trocar conta',
    'Configurações',
    'Sair',
  ];
}
