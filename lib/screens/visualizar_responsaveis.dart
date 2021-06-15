import 'package:app_momoveis/model/imovel.dart';
import 'package:app_momoveis/model/item.dart';
import 'package:flutter/material.dart';

const String _appTitle = "Todos Responsáveis";
const String _listaTitulo = "Todos os Responsáveis";
class Responsaveis  extends StatelessWidget {

    @override
  Widget build(BuildContext context) {
    final Imovel imovel = ModalRoute.of(context).settings.arguments != null
        ? ModalRoute.of(context).settings.arguments
        : new Imovel([]);
    List<Item> items = [];
    imovel.grupos.forEach((g) {
      g.items.forEach((i) {
        items.add(i);
      });
    });

    return Scaffold(
      appBar: AppBar(title: Text(_appTitle)),
      backgroundColor: Color.fromRGBO(38, 50, 56, 1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _listaTitulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height- 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(6),
                          height: 25,
                          color: Colors.grey[400],
                          child: Center(child: Text('${items[index].responsavel}')),
                        );
                      })),
            ],
          ),
        ],
      ),
    );
  }
}