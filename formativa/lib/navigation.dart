import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formativa/book.dart';
import 'package:formativa/books.dart';

class NavApp extends StatefulWidget {
  const NavApp({super.key});

  @override
  State<NavApp> createState() => _NavAppState();
}

class _NavAppState extends State<NavApp> {
  int selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Books(),
    Livros(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18202A),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF18202A),
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFF2f6fc4),
        onTap: onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar Livro',
          ),
        ],
      ),
    );
  }
}
