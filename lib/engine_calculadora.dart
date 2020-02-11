import 'package:flutter/cupertino.dart';
import 'dart:math';

class EngineCalculadora {
  final int altura;
  final int peso;
  double _imc;

  EngineCalculadora({@required this.altura, @required this.peso});

  String resultadoCalculo() {
    _imc = peso / pow((altura / 100), 2);
    return _imc.toStringAsFixed(
        1); //retorna em formato de string com casa decimal fixada
  }

  String getResultado() {
    if (_imc < 18.6) {
      return 'Abaixo do peso IMC';
    } else if (_imc >= 18.6 && _imc < 24.9) {
      return 'Peso Ideal IMC';
    } else if (_imc >= 24.9 && _imc < 29.9) {
      return 'Levemente acima do peso IMC';
    } else if (_imc >= 29.9 && _imc < 34.9) {
      return 'Obesidade Grau I IMC';
    } else if (_imc >= 34.9 && _imc < 39.9) {
      return 'Obesidade Grau II IMC';
    } else if (_imc >= 40) {
      return 'Obesidade Grau III IMC';
    } else {
      return 'deu ruim';
    }
  }

  String getInterpretacao() {
    if (_imc < 18.6) {
      return 'Ou cresce ou engorda';
    } else if (_imc >= 18.6 && _imc < 24.9) {
      return 'Ta tranquilao';
    } else if (_imc >= 24.9 && _imc < 29.9) {
      return 'Talvez comceçar a pensar na sua alimentacao seja uma boa ideia';
    } else if (_imc >= 29.9 && _imc < 34.9) {
      return 'Ficar o dia todo na frente do PC talvez nao seja uma boa ideia ne?';
    } else if (_imc >= 34.9 && _imc < 39.9) {
      return 'Mano, para de comer namoral';
    } else if (_imc >= 40) {
      return 'Voce precisa de ajuda';
    } else {
      return 'deu ruim';
    }
  }
}
