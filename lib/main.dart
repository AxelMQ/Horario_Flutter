import 'package:flutter/material.dart';
import 'package:flutter_horario2/screens/HomeScreen.dart';
import 'package:flutter_horario2/screens/MateriaScreen.dart';
import 'package:flutter_horario2/screens/RegisterMateriaScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horario App',
      initialRoute: '/home',
      routes: {
        '/home' :(context) => const HomeScreen(),
        // '/registerMateria' :(context) => const RegisterMateriaScreen(),
        '/materia' :(context) => const MateriaScreen(),
      },
      theme: ThemeData(useMaterial3: true),
    );
  }
}