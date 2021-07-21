import 'package:flutter/material.dart';
import 'package:testpoc/pages/form.page.dart';
import 'package:testpoc/pages/login.page.dart';
import 'package:testpoc/pages/store.page.dart';

MenuPage homePage = const MenuPage(title: 'Localiza Meoo');

void main() {

  runApp(MyApp(
    key: UniqueKey(),
  ));
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const FormPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;

  final pages = [
    const Center(child: Text('Home')),
    //const Center(child: Text('Faturas')),
    const StorePage(),
    const Center(child: Text('Ajuda')),
    const Center(child: Text('Perfil')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          key: const Key('menu-bottom'),
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green,
          iconSize: 32,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              //backgroundColor: Colors.blue
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Faturas',
              //backgroundColor: Colors.blue
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: 'Ajuda',
              //backgroundColor: Colors.blue
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
              //backgroundColor: Colors.blue
            ),
          ]),
    );
  }
}
