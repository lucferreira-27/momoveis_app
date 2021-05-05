import 'package:app_momoveis/components/grupo_panel.dart';
import 'package:app_momoveis/model/grupo.dart';
import 'package:app_momoveis/model/item.dart';
import 'package:app_momoveis/screens/formulario_item.dart';
import 'package:flutter/material.dart';

class GrupoLocal extends StatefulWidget {
  @override
  _GrupoLocalState createState() => _GrupoLocalState();
}

class _GrupoLocalState extends State<GrupoLocal> {
  @override
  Widget build(BuildContext context) {
    final Grupo _grupo = ModalRoute.of(context).settings.arguments;

    final List<Item> entries = _grupo.items;



    return Scaffold(
      appBar: AppBar(
        title: Text("Local"),
      ),
      backgroundColor: Color.fromRGBO(38, 50, 56, 1),
      body: ListView(
        children: [
          Column(children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _grupo.nome,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GrupoPanel(
                    grupo: _grupo, height: 230, weight: 350, label: false),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Itens",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: 405,
                height: 252,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(6),
                        height: 25,
                        color: Colors.grey[400],
                        child: Center(child: Text('${entries[index].nome}')),
                      );
                    }))
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {

          Navigator.pushNamed(context, '/formulario', arguments: _grupo)

        },
        child: Icon(Icons.add,
          color: Colors.grey[600],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
