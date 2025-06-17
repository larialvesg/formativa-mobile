import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:formativa/books.dart';
import 'package:formativa/login.dart';
import 'package:formativa/navigation.dart';
import 'firebase_options.dart';

// Pagina main
void main() async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
      ),
      // nossa home na verdade é a pagina login
      home: LoginPage(),
    );
  }
}



