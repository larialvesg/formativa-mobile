import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formativa/putlivros.dart';

class Books extends StatelessWidget {
  const Books({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
  
            ),
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance.collection('livros').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Erro ao carregar os livros!',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }

                  final livros = snapshot.data!.docs;

                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: livros.length,
                    itemBuilder: (context, index) {
                      final livro = livros[index];
                      final data = livro.data() as Map<String, dynamic>;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Putlivros(
                                documentId: livro.id,
                                nome_lista: data['nome'] ?? '',
                                genero_lista: data['genero'] ?? '',
                                autor_lista: data['autor'] ?? '',
                                capa_lista: data['imagem'] ?? '',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                data['imagem'],
                                width: 130,
                                height: 170,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.image_not_supported, size: 100),
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  data['nome'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 51, 77, 112),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                data['autor'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 51, 77, 112),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                data['genero'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color:Color.fromARGB(255, 51, 77, 112),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
