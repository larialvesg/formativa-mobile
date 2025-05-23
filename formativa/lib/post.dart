import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:formativa/books.dart';
import 'package:formativa/login.dart';
import 'package:formativa/navigation.dart';

class PostLivros extends StatefulWidget {
  const PostLivros({super.key});

  @override
  State<PostLivros> createState() => _PostLivrosScreenState();
}

class _PostLivrosScreenState extends State<PostLivros> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController generoController = TextEditingController();
  final TextEditingController autorController = TextEditingController();
  final TextEditingController capaController = TextEditingController();
  final TextEditingController avaliacaoController = TextEditingController();

  Future<void> postData() async {
    final String nome = nomeController.text;
    final String autor = autorController.text;
    final String genero = generoController.text;
    final String capa = capaController.text;
    final String avaliacao = avaliacaoController.text;

    await FirebaseFirestore.instance.collection('livros').add({
      'nome': nome,
      'genero': genero,
      'autor': autor,
      'imagem': capa,
      'avaliacao': avaliacao,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Seus dados foram enviados com sucesso!')),
    );

    nomeController.clear();
    generoController.clear();
    capaController.clear();
    autorController.clear();
    avaliacaoController.clear();

    Navigator.push(context, MaterialPageRoute(builder: (context) => NavApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18202A),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Postar Livro',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: nomeController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Nome do livro',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.white12,
                ),
              ),
              SizedBox(height: 28),
              TextField(
                controller: generoController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Gênero',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.white12,
                ),
              ),
              SizedBox(height: 28),
              TextField(
                controller: autorController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Autor',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.white12,
                ),
              ),
              SizedBox(height: 28),
              TextField(
                controller: capaController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'URL da capa',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.white12,
                ),
              ),
              SizedBox(height: 28),
              TextField(
                controller: avaliacaoController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Avaliação do Livro',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.white12,
                ),
              ),
              SizedBox(height: 28),
              ElevatedButton(
                onPressed: postData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 25, 62, 114),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Enviar',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
