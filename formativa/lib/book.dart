import 'package:flutter/material.dart';
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
  String avaliacao = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    FirebaseFirestore.instance.collection('livros').snapshots().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        var data = snapshot.docs.last.data();
        setState(() {
          nome = (data['nome'] ?? "Não disponível");
          autor = (data['autor'] ?? "Não disponível");
          genero = (data['genero'] ?? "Não disponível");
          capa = (data['imagem'] ?? "");
          avaliacao = (data["avaliacao"] ?? "Não disponível");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18202A),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              nome,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                capa,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.white30,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Autor: $autor",
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
            Text(
              "Gênero: $genero",
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        avaliacao,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white24,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Voltar",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
