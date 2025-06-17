import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formativa/api.dart';

import 'package:formativa/books.dart';
import 'package:formativa/loginAULA.dart';
import 'package:formativa/mapa.dart';
import 'package:formativa/post.dart';

class NavApp extends StatefulWidget {
  const NavApp({super.key});

  @override
  State<NavApp> createState() => _NavAppState();
}

class _NavAppState extends State<NavApp> {
  int selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Books(),
    PostLivros(),
    Mapa(),
    TelaGet()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 31, 68),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF18202A),
        currentIndex: selectedIndex,
        selectedItemColor: Color(0xFF2f6fc4),
        unselectedItemColor:   Color.fromARGB(255, 1, 31, 68),
        onTap: onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar Livro',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'API',
          ),
        ],
      ),
    );
  }
}
