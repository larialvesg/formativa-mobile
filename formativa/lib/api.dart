import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Nesta página, estamos puxando os dados de uma API.

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  String? conselhos;

  @override
  void initState() {
    super.initState();
    getConselhos();
  }

  void getConselhos() async {
    final response = await http.get(
      // aqui estamos inserindo o url da api 
      Uri.parse("https://api.adviceslip.com/advice"),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        conselhos = data['slip']['advice'];
      });
    }
    else {
      setState(() {
        conselhos = "Não tem conselhos disponiveis";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Minha página de get")),
      body: Center(
        // aqui estamos mostrando os conselhos e se não conseguimos puxar os conselhos ele aparece um icone de carregamento
        child: conselhos == null ? CircularProgressIndicator(): Text(conselhos!),
      )
    );
  }
}
