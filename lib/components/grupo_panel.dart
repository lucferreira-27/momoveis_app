import 'package:app_momoveis/model/grupo.dart';
import 'package:flutter/material.dart';

class GrupoPanel extends StatelessWidget {
  
  final Grupo grupo;
  final Function onTap;
  final double height;
  final double weight;
  
  GrupoPanel({this.grupo, this.onTap, this.height = 230, this.weight = 350});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            child: adicionarLabel(grupo.nome),
            height: height,
            width: weight,
            decoration: adicionarImagem(grupo.image)),
      ),
    );
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
