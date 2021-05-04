import 'package:app_momoveis/components/grupo_panel.dart';
import 'package:app_momoveis/model/grupo.dart';
import 'package:flutter/material.dart';

class GrupoLocal extends StatefulWidget {
  @override
  _GrupoLocalState createState() => _GrupoLocalState();
}

class _GrupoLocalState extends State<GrupoLocal> {
  @override
  Widget build(BuildContext context) {
    final Grupo _grupo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Local"),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_grupo.nome),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GrupoPanel(grupo: _grupo, height: 230, weight: 350),
          ],
        ),
      ]),
    );
  }
}
