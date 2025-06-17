import 'package:flutter/material.dart';
import 'package:formativa/auth.dart';
import 'package:formativa/books.dart';

// Essa é a nossa tela de cadastro

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18202A),
      appBar: AppBar(
        backgroundColor: Color(0xff18202A),
        title: Text(
          "Cadastrar Usuário",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // espaço pro usuario digitar e-mail
              TextField(
                controller: _email,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Digite seu e-mail",
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
                // espaço para o usuario digitar a senha
                controller: _senha,
                obscureText: true,
                obscuringCharacter: "*",
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Digite sua senha",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // botao para mandar dados para o cadastro
                  ElevatedButton(
                    onPressed: () async {
                      final message = await AuthService().registration(
                        email: _email.text,
                        password: _senha.text,
                      );
                      if (message!.contains("Success")) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Books()),
                        );
                      }
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(message)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF193E72),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _email.text = '';
                      _senha.text = '';
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF193E72),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Limpar",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
