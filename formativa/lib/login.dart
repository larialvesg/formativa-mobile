import 'package:flutter/material.dart';
import 'package:formativa/auth.dart';
import 'package:formativa/cadastro.dart';
import 'package:formativa/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2f6fc4),
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
              controller: _email,
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
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _senha,
              obscureText: true,
              style: TextStyle(color: Color(0xff182537)),
              decoration: InputDecoration(
                hintText: 'Digite sua senha:',
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
            ),
            const SizedBox(height: 45),
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
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
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
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
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
