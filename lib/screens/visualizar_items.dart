import 'package:app_momoveis/model/dao/item_dao.dart';
import 'package:app_momoveis/model/movel.dart';
import 'package:app_momoveis/model/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const String _appTitle = "Todos Itens";
const String _listaTitulo = "Todos os Itens";

class VisualizarItems extends StatefulWidget {
  @override
  _VisualizarItemsState createState() => _VisualizarItemsState();
}

class _VisualizarItemsState extends State<VisualizarItems> {
  CollectionReference items;

  @override
  void initState() {
    super.initState();
    items = Database.resgatarCollection('moveis');
  }

  @override
  Widget build(BuildContext context) {
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
                    fontSize: 34,
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
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: resgatarDados()),
            ],
          ),
        ],
      ),
    );
  }

  Widget resgatarDados() {
    return StreamBuilder<QuerySnapshot>(
        stream: items.snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text('Erro ao conectar firestore'));
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return exibirListaDeItems(snapshot);
          }
        });
  }

  Widget exibirListaDeItems(snapshot) {
    final dados = snapshot.requireData;
    return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dados.size,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(6),
            height: 35,
            color: Colors.grey[400],
            child: mostrarDadosDoItem(dados.docs[index]),
          );
        });
  }

  Widget mostrarDadosDoItem(item) {
    ItemDao itemDao = ItemDao.fromJson(item.data(), item.id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(right: 90),
            child: Center(child: Text('${itemDao.nome}'))),
        IconButton(
            onPressed: () {
              removeItem(itemDao);
            },
            icon: Icon(Icons.delete)),
        IconButton(
            onPressed: () {
              editItem(itemDao);
            },
            icon: Icon(Icons.edit))
      ],
    );
  }

  removeItem(itemDao) {
    Database.deletarDocumentoComReferencia(items, itemDao.id);
  }
  salvarItem(itemDao){
      Database.atualizarDocumentoComReferencia(items, itemDao.id, itemDao.toJson());
  }
  editItem(itemDao) {
              Navigator.pushNamed(context, '/editarItem', arguments: itemDao).then((itemRecebido) => {
               
                setState(() => {
                  
                      if (itemRecebido != null)
                        {
                          salvarItem(itemRecebido)
                        }
                    })
                    
              });
  }
}
