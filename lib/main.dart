import 'package:flutter/material.dart';
import 'telas/tela_principal.dart';

void main() => runApp(AppCalculadoraIMC());

class AppCalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC v2',
      home: TelaPrincipal(),
      theme: ThemeData.dark().copyWith(
        //permite modificar o tema ja existente
        primaryColor: Color(0xFF739C3E),
        scaffoldBackgroundColor: Color(0xFF739C3E),
      ),
      routes: {
        // '/resultado': (context) => TelaResultado(),
        '/principal': (context) => TelaPrincipal(),
      },
    );
  }
}
