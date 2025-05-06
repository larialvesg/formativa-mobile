import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Putlivros extends StatefulWidget {
  final String documentId;
  final String nome_lista;
  final String genero_lista;
  final String autor_lista;
  final String capa_lista;

  const Putlivros({
    super.key,
    required this.documentId,
    required this.nome_lista,
    required this.genero_lista,
    required this.autor_lista,
    required this.capa_lista,
  });

  @override
  State<Putlivros> createState() => _PutlivrosState();
}

class _PutlivrosState extends State<Putlivros> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController autorController = TextEditingController();
  TextEditingController capaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nomeController.text = widget.nome_lista;
    generoController.text = widget.genero_lista;
    autorController.text = widget.autor_lista;
    capaController.text = widget.capa_lista;
  }

  Future<void> updateLivro() async {
    String nome = nomeController.text;
    String genero = generoController.text;
    String autor = autorController.text;
    String capa = capaController.text;

    await FirebaseFirestore.instance
        .collection('livros')
        .doc(widget.documentId)
        .set(
          {'nome': nome, 'genero': genero, "autor": autor, "imagem": capa},
          SetOptions(merge: true),
        );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Dados enviados com sucesso!')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.nome_lista}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), backgroundColor:  Color(0xFF2f6fc4),),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Image.network(widget.capa_lista,
            width: MediaQuery.of(context).size.width *0.5  ,
            ),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do livro'),
            ),
            TextField(
              controller: generoController,
              decoration: InputDecoration(labelText: 'Gênero'),
            ),
            TextField(
              controller: autorController,
              decoration: InputDecoration(labelText: 'Autor'),
            ),
            TextField(
              controller: capaController,
              decoration: InputDecoration(labelText: 'URL da capa'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateLivro,
              child: Text('Salvar alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
