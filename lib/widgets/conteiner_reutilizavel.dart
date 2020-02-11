import 'package:flutter/material.dart';

class ContainerReutilizavel extends StatelessWidget {
  ContainerReutilizavel({@required this.cor, this.filhoConteiner, this.selecionado}); //tag required faz com que o metodo construtor exija o atributo no momento de instancia no caso dos widgets

  final Widget filhoConteiner;
  final Color cor; // final eh um tipo de variavel que permite um valor ser atribuido apenas uma vez, a partir dai esse mesmo valor eh imutavel
  final Function selecionado;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selecionado,
      child: Container(
        child: filhoConteiner,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
