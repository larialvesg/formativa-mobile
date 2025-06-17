import 'package:flutter/material.dart';
import 'package:formativa/auth.dart';
import 'package:formativa/books.dart';
import 'package:formativa/cadastro.dart';
import 'package:formativa/navigation.dart';

class LoginAula extends StatefulWidget {
  const LoginAula({super.key});

  @override
  State<LoginAula> createState() => _LoginAulaState();
}

class _LoginAulaState extends State<LoginAula> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Página de Login")),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _email,
              decoration: InputDecoration(hintText: "Digite seu email: "),
            ),
            TextField(
              controller: _senha,
              decoration: InputDecoration(hintText: "Digite sua senha: "),
              obscureText: true,
              obscuringCharacter: "*",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final message = await AuthService().login(
                      email: _email.text,
                      password: _senha.text,
                    );
                    if (message!.contains("Success")) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavApp()),
                      );
                    }
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(message)));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 62, 114),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 62, 114),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "CADASTRAR",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
