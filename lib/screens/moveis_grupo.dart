import 'package:app_momoveis/components/grupo_panel.dart';
import 'package:app_momoveis/model/grupo.dart';
import 'package:app_momoveis/model/imovel.dart';
import 'package:flutter/material.dart';

class GrupoMoveis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("Build: GrupoMoveis");
    final Imovel imovel = ModalRoute.of(context).settings.arguments != null
        ? ModalRoute.of(context).settings.arguments
        : new Imovel([]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Grupo Movéis"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, imovel.grupos),
        ),
      ),
      backgroundColor: Color.fromRGBO(38, 50, 56, 1),
      body: ListView(
        children: [
          _criarGrupoPanel(
              context, imovel, "Cozinha", "images/grupos/cozinha.png"),
          _criarGrupoPanel(
              context, imovel, "Escritorio", "images/grupos/escritorio.png"),
          _criarGrupoPanel(
              context, imovel, "Quarto", "images/grupos/quarto.png"),
          _criarGrupoPanel(
              context, imovel, "Quintal", "images/grupos/quintal.png"),
          _criarGrupoPanel(
              context, imovel, "Garagem", "images/grupos/garagem.png"),
        ],
      ),
    );
  }

  _criarGrupoPanel(
      BuildContext context, Imovel imovel, String nome, String caminho) {
    Grupo grupo;
    for (var i = 0; i < imovel.grupos.length; i++) {
      Grupo g = imovel.grupos[i];
      if (g.nome == nome) {
        grupo = g;
      }
    }

    if (grupo == null) {
      grupo = new Grupo(nome, caminho);
      imovel.grupos.add(grupo);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GrupoPanel(
            grupo: grupo,
            onTap: () =>
                {Navigator.pushNamed(context, '/local', arguments: grupo)},
            height: 230,
            weight: 350),
      ],
    );
  }
}
