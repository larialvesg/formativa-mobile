import 'package:flutter/material.dart';
import 'package:formativa/books.dart';
import 'package:formativa/navigation.dart';

TextEditingController _user = TextEditingController();
TextEditingController _pass = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String usuario_cadastrado = 'larissa';
  String senha_cadastrada = 'alves';
  String verificador = "";

  bool Logar() {
    if (_user.text == usuario_cadastrado && _pass.text == senha_cadastrada) {
      print("Login realizado com sucesso");
      return true;
    } else {
      print("Credenciais erradas");
      setState(() {
        verificador = 'Credenciais Erradas';
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF2f6fc4),
      
      body: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/bambi.png')),
            Text(
              "Bem vindo a sua biblioteca virtual!",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Aqui você pode gerenciar seus livros e compartilhar suas leituras",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(height: 50),
            TextField(
              textAlign: TextAlign.start,
              style: TextStyle(color: Color(0xff182537)),
              decoration: InputDecoration(
                hintText: 'Digite seu usuário :',
                hintStyle: TextStyle(
                  color: Color(0xff182537),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              controller: _user,
            ),
            const SizedBox(height: 30),
            TextField(
              textAlign: TextAlign.start,
              obscureText: true,
              style: TextStyle(color: Color(0xff182537)),
              decoration: InputDecoration(
                hintText: 'Digite seu senha: ',
                hintStyle: TextStyle(
                  color: Color(0xff182537),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              controller: _pass,
            ),
            const SizedBox(height: 45),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff182537),
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 8,
                ),
              ),
              onPressed: () {
                if (Logar()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavApp()),
                  );
                }
              },
              child: Text("Logar", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}