import 'package:flutter/material.dart';
import 'package:desafio_08_calc_imc/constantes.dart';

class BotaoInferior extends StatelessWidget {
  BotaoInferior({@required this.texto, this.pressionado});
  final String texto;
  final Function pressionado;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressionado,
      child: Container(
        color: kCorContainerInferior,
        width: double.infinity,
        height: kAlturaBarraInferior,
        child: Center(
          child: Text(
            texto,
            style: kEstiloTextoConteiner,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
