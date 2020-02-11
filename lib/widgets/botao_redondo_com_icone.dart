import 'package:flutter/material.dart';
import 'package:desafio_08_calc_imc/constantes.dart';

class BotaoRedondoComIcone extends StatelessWidget { //criando um widget do zero utilizando widgets mais basicos do flutter para atender nossas necessidades, no caso um botao redondo com um icone com dado tamanho, forma cor etc. Outro fator da criacao de um botao do zero eh o fato do time flutter nao recomendar o uso de mais de um Floating Action Button por tela.

  BotaoRedondoComIcone({@required this.icone, @required this.apertado});
  final IconData icone;
  final Function apertado;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icone,color: kCorContainerInferior,),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFFcadbb7),
      onPressed: apertado,


    );
  }
}