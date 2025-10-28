import 'package:flutter/material.dart';
import 'view/inicio.dart';
import 'view/resultado.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Números Amigos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Inicio(),
        '/resultado': (context) => Resultado(),
      },
    );
  }
}