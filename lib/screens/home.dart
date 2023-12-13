import 'package:flutter/material.dart';
import 'package:agenclean_project/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: corEscura,
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
      body: Center(
        child: _navBarItems[_selectedIndex].title,
      ),
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

  Widget _drawer() => Drawer(
        child: ListView(
          children: _menuItems
              .map((item) => ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    title: Text(item),
                  ))
              .toList(),
        ),
      );

  final _navBarItems = [
    SalomonBottomBarItem(
      icon: const Icon(Icons.home),
      title: const Text("Home"),
      selectedColor: Colors.blue[50],
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.search),
      title: const Text("Search"),
      selectedColor: Colors.blue[50],
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.add_circle_outlined),
      title: const Text("Likes"),
      selectedColor: Colors.blue[50],
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.chat),
      title: const Text("Chat"),
      selectedColor: Colors.blue,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.person),
      title: const Text("Profile"),
      selectedColor: Colors.blue[50],
    ),
  ];

  final List<String> _menuItems = <String>[
    'About',
    'Contact',
    'Settings',
    'Sign Out',
  ];
}
