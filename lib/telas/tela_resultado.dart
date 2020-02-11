import 'package:desafio_08_calc_imc/constantes.dart';
import 'package:desafio_08_calc_imc/widgets/botao_inferior.dart';
import 'package:desafio_08_calc_imc/widgets/conteiner_reutilizavel.dart';
import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  TelaResultado(
      {@required this.imc,
      @required this.resumo,
      @required this.interpretacao});

  final String imc;
  final String resumo;
  final String interpretacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 30.0),
                  child: Text(
                    'SEU RESULTADO',
                    style:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ContainerReutilizavel(
                cor: kCorContainerAtivo,
                filhoConteiner: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resumo,
                      style: kEstiloTextoResultado,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      imc,
                      style: kEstiloNumeroResultado,
                    ),
                    Text(
                      interpretacao,
                      style: kEstiloTextoResultadoResumo,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            BotaoInferior(
                texto: 'RECALCULAR',
                pressionado: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
