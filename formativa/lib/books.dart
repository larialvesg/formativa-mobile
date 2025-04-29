import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Livros extends StatefulWidget {
  const Livros({super.key});

  @override
  State<Livros> createState() => _LivrosState();
}

class _LivrosState extends State<Livros> {
  String nome = "";
  String autor = "";
  String genero = "";
  String capa = "";

  @override
  void initState() { 
    super.initState();
    fetchData();
  }

  void fetchData() { 
    FirebaseFirestore.instance.collection('livros').snapshots().listen((snapshot) {
      var data = snapshot.docs.last.data();
      setState(() {
        nome = (data['nome'] ?? "Não disponível");
        autor = (data['autor'] ?? "Não disponível");
        genero = (data['genero'] ?? "Não disponível");
        capa = (data['imagem'] ?? "Não disponível");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF2f6fc4),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 70),
              Container(
                width: 350,
                height: 420,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Image.network(
                  capa,  
                
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                nome,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Autor: $autor",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                "Gênero: $genero",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "Voltar",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
