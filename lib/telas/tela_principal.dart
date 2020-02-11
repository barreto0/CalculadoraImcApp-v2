import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/conteiner_reutilizavel.dart';
import '../widgets/conteudo_Icone.dart';
import '../constantes.dart';
import '../widgets/botao_redondo_com_icone.dart';
import '../widgets/botao_inferior.dart';
import 'package:desafio_08_calc_imc/engine_calculadora.dart';
import 'tela_resultado.dart';

enum Genero {
  homem,
  mulher
} //enums sao tipos de variaveis que te permitem criar listas de palavras para que o codigo fique mais legivel

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  /*Color corContainerHomem = corContainerInativo;
  Color corContainerMulher = corContainerInativo;


 void mudaCorContainer(Genero genero){

   if(genero == Genero.homem){
     if(corContainerHomem == corContainerInativo){
       corContainerHomem = corContainerAtivo;
       corContainerMulher = corContainerInativo;
     }else{
       corContainerHomem = corContainerInativo;
     }
   }
   if(genero == Genero.mulher){
     if(corContainerMulher == corContainerInativo){
       corContainerMulher = corContainerAtivo;
       corContainerHomem = corContainerInativo;
     }else{
       corContainerMulher = corContainerInativo;
     }
   }

 }*/

  Genero generoSelecionado;
  int altura = 170;
  int peso = 70;
  int idade = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ContainerReutilizavel(
                    cor: generoSelecionado == Genero.homem
                        ? kCorContainerAtivo
                        : kCorContainerInativo, //Condition ? DoThisIfTrue : DoThisIfFalse
                    filhoConteiner: ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      texto: 'HOMEM',
                    ),
                    selecionado: () {
                      setState(() {
                        generoSelecionado = Genero.homem;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ContainerReutilizavel(
                    cor: generoSelecionado == Genero.mulher
                        ? kCorContainerAtivo
                        : kCorContainerInativo,
                    filhoConteiner: ConteudoIcone(
                      icone: FontAwesomeIcons.venus,
                      texto: 'MULHER',
                    ),
                    selecionado: () {
                      setState(() {
                        generoSelecionado = Genero.mulher;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerReutilizavel(
              cor: kCorContainerAtivo,
              filhoConteiner: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ALTURA',
                    style: kEstiloTextoConteiner,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        altura.toString(),
                        style: kEstiloNumeroConteiner,
                      ),
                      Text(
                        'cm',
                        style: kEstiloTextoConteiner,
                      )
                    ],
                  ),
                  Slider(
                    // se quiser uma maior customizaçao do slider envelopar o mesmo no SliderTheme(data:                      SliderTheme.of(context).copyWith()
                    value: altura.toDouble(),
                    min: 100.0,
                    max: 260.0,
                    activeColor: kCorContainerInativo,
                    inactiveColor: Color(0xFFDCD294),
                    onChanged: (double novoValor) {
                      setState(() {
                        altura = novoValor.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ContainerReutilizavel(
                    cor: kCorContainerAtivo,
                    filhoConteiner: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PESO',
                          style: kEstiloTextoConteiner,
                        ),
                        Text(
                          peso.toString(),
                          style: kEstiloNumeroConteiner,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BotaoRedondoComIcone(
                              icone: FontAwesomeIcons.plus,
                              apertado: () {
                                setState(() {
                                  peso++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotaoRedondoComIcone(
                              icone: FontAwesomeIcons.minus,
                              apertado: () {
                                setState(() {
                                  if (peso > 1) {
                                    peso--;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerReutilizavel(
                    cor: kCorContainerAtivo,
                    filhoConteiner: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'IDADE',
                          style: kEstiloTextoConteiner,
                        ),
                        Text(
                          idade.toString(),
                          style: kEstiloNumeroConteiner,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BotaoRedondoComIcone(
                              icone: FontAwesomeIcons.plus,
                              apertado: () {
                                setState(() {
                                  idade++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotaoRedondoComIcone(
                              icone: FontAwesomeIcons.minus,
                              apertado: () {
                                setState(() {
                                  if (idade > 1) {
                                    idade--;
                                  }
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotaoInferior(
            texto: 'CALCULAR',
            pressionado: () {
              EngineCalculadora calc =
                  EngineCalculadora(altura: altura, peso: peso);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaResultado(
                            imc: calc.resultadoCalculo(),
                            resumo: calc.getResultado(),
                            interpretacao: calc.getInterpretacao(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
