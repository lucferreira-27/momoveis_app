import 'package:app_momoveis/model/dao/grupo_dao.dart';
import 'package:app_momoveis/model/grupo.dart';
import 'package:flutter/material.dart';

class GrupoPanel extends StatelessWidget {
  final GrupoDao grupo;
  final Function onTap;
  final double height;
  final double weight;
  final bool label;
  GrupoPanel({this.grupo, this.onTap, this.height = 230, this.weight = 320, this.label = true});

  @override
  Widget build(BuildContext context) {

    var grupoPanel = label  ? adicionarPanel() : adicionarPanelSemLabel();

    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: grupoPanel,
      ),
    );
  }

  Container adicionarPanel() {
    return Container(
        child: adicionarLabel(grupo.nome),
        height: height,
        width: weight,
        decoration: adicionarImagem(grupo.image));
  }
    Container adicionarPanelSemLabel() {
    return Container(
        height: height,
        width: weight,
        decoration: adicionarImagem(grupo.image));
  }

  Row adicionarLabel(String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black54,
          ),
          height: 37,
          width: 342,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center),
            ],
          ),
        )
      ],
    );
  }

  BoxDecoration adicionarImagem(String caminho) {
    return BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(caminho),
      ),
      borderRadius: BorderRadius.circular(5),
      color: Color.fromARGB(255, 33, 49, 56),
      border: Border.all(
        color: Colors.white,
        width: 4,
      ),
    );
  }
}
