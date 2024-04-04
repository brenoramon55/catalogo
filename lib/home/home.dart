import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Oi'), // Título do AppBar
        ),
        body: Center(
          child: Text('Olá, mundo!'), // Conteúdo da tela
        ),
      ),
    );
  }
}
