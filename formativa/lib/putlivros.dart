import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Putlivros extends StatefulWidget {
  final String documentId;
  final String nome_lista;
  final String genero_lista;
  final String autor_lista;
  final String capa_lista;
  final String avaliacao_lista;

  Putlivros({
    Key? key,
    required this.documentId,
    required this.nome_lista,
    required this.genero_lista,
    required this.autor_lista,
    required this.capa_lista,
    required this.avaliacao_lista,
  }) : super(key: key);

  @override
  _PutlivrosState createState() => _PutlivrosState();
}

class _PutlivrosState extends State<Putlivros> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController autorController = TextEditingController();
  TextEditingController capaController = TextEditingController();
  TextEditingController avaliacaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nomeController.text = widget.nome_lista;
    generoController.text = widget.genero_lista;
    autorController.text = widget.autor_lista;
    capaController.text = widget.capa_lista;
    avaliacaoController.text = widget.avaliacao_lista;
  }

  void updateLivro() async {
    await FirebaseFirestore.instance
        .collection('livros')
        .doc(widget.documentId)
        .set({
          'nome': nomeController.text,
          'genero': generoController.text,
          'autor': autorController.text,
          'imagem': capaController.text,
          'avaliacao': avaliacaoController.text,
        }, SetOptions(merge: true));

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Dados enviados com sucesso!')));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18202A),
      appBar: AppBar(
        title: Text(widget.nome_lista, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xff2f6fc4),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              widget.capa_lista,
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 22),
            TextField(
              controller: nomeController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nome do livro',
                labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
            SizedBox(height: 20),
            TextField(
              controller: generoController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Gênero',
                labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
            SizedBox(height: 20),
            TextField(
              controller: autorController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Autor',
                labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
            SizedBox(height: 20),
            TextField(
              controller: capaController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'URL da capa',
                labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
            SizedBox(height: 20),
            TextField(
              controller: avaliacaoController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Avaliação do Livro',
                labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
            SizedBox(height: 18),
            ElevatedButton(
              onPressed: updateLivro,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2f6fc4),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Salvar alterações',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
