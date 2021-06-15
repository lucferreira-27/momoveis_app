import 'package:app_momoveis/components/grupo_panel.dart';
import 'package:app_momoveis/model/dao/grupo_dao.dart';
import 'package:app_momoveis/model/dao/item_dao.dart';
import 'package:app_momoveis/model/grupo.dart';
import 'package:app_momoveis/model/item.dart';
import 'package:app_momoveis/screens/formulario_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GrupoLocal extends StatefulWidget {
  @override
  _GrupoLocalState createState() => _GrupoLocalState();
}

class _GrupoLocalState extends State<GrupoLocal> {
  CollectionReference items;
  GrupoDao grupoDao;
  @override
  void initState() {
    super.initState();
    items = FirebaseFirestore.instance.collection("moveis");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Build: GrupoLocalState");

    grupoDao = ModalRoute.of(context).settings.arguments;

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
                    grupoDao.nome,
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
                    grupo: grupoDao, height: 230, weight: 350, label: false),
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
                width: MediaQuery.of(context).size.width - 50,
                height: MediaQuery.of(context).size.height - 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: resgatarDados())
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, '/formulario').then((itemRecebido) => {
               
                setState(() => {
                  
                      if (itemRecebido != null)
                        {
                          registrarItemDao(itemRecebido)
                        }
                    })
                    
              })
        },
        child: Icon(
          Icons.add,
          color: Colors.grey[600],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }


  registrarItemDao(itemDao){
    grupoDao.nome;
    itemDao.local =  grupoDao.nome;
  FirebaseFirestore.instance.collection('moveis').add(itemDao.toJson());
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
    final itemsFiltrados = apenasItemsDoLocal(dados);
    return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: itemsFiltrados.length,
        itemBuilder: (BuildContext context, int index) {
          return mostrarDadosDoItem(itemsFiltrados[index]);
        });
  }

  List apenasItemsDoLocal(dados){
    List dadosFiltrados = [];
    for(int i = 0; i < dados.size; i++){
      ItemDao itemDao = ItemDao.fromJson(dados.docs[i].data(), dados.docs[i].id);
     if(itemPerteceLocal(itemDao)){
       dadosFiltrados.add(itemDao);
     }
    }
    return dadosFiltrados;
  }

   bool itemPerteceLocal(ItemDao itemDao){
      debugPrint("${itemDao.local.toLowerCase()} == ${grupoDao.nome.toLowerCase()}");
      return itemDao.local.toLowerCase() == grupoDao.nome.toLowerCase();
  }

  Widget mostrarDadosDoItem(itemDao) {

    return Container(
        margin: EdgeInsets.all(6),
        height: 25,
        color: Colors.grey[400],
        child: Center(
          child: Text('${itemDao.nome}'),
        ));
  }
}
