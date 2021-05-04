import 'package:app_momoveis/components/grupo_panel.dart';
import 'package:app_momoveis/model/grupo.dart';
import 'package:flutter/material.dart';

class GrupoMoveis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grupo Movéis")),
      backgroundColor: Color.fromRGBO(38, 50, 56, 1),
      body: ListView(
        children: [
          _criarGrupoPanel(context,"Cozinha", "images/grupos/cozinha.png", null),
          _criarGrupoPanel(context,"Escritorio", "images/grupos/escritorio.png", null),
          _criarGrupoPanel(context,"Quarto", "images/grupos/quarto.png", null),
          _criarGrupoPanel(context,"Quintal", "images/grupos/quintal.png", null),
          _criarGrupoPanel(context,"Garagem", "images/grupos/garagem.png", null),
        ],
      ),
    );
  }

  _criarGrupoPanel(
      BuildContext context, String nome, String caminho, Function onPress) {
    Grupo _grupo = new Grupo(nome, null, caminho);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GrupoPanel(
            grupo: _grupo,
            onTap: () =>
                {Navigator.pushNamed(context, '/grupo/local', arguments: _grupo)},
            height: 230,
            weight: 350),
      ],
    );
  }
}
