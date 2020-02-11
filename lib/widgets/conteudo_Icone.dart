import 'package:flutter/material.dart';
import 'package:desafio_08_calc_imc/constantes.dart';

class ConteudoIcone extends StatelessWidget {

  final IconData icone;
  final String texto;

  ConteudoIcone({this.icone,this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icone,
          size: 70.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(texto ,style: kEstiloTextoConteiner,
        )
      ],
    );
  }
}
