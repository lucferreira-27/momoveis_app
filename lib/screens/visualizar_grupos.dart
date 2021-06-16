import 'package:app_momoveis/components/grupo_panel.dart';
import 'package:app_momoveis/model/dao/grupo_dao.dart';
import 'package:app_momoveis/model/imovel.dart';
import 'package:app_momoveis/model/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GrupoMoveis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Imovel imovel = ModalRoute.of(context).settings.arguments != null
        ? ModalRoute.of(context).settings.arguments
        : new Imovel([]);
  final CollectionReference locais = Database.resgatarCollection("locais");
    return Scaffold(
      appBar: AppBar(
        title: Text("Grupo Movéis"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, imovel.grupos),
        ),
      ),
      backgroundColor: Color.fromRGBO(38, 50, 56, 1),
      body: resgatarDados(locais)
    );
  }



  _criarGrupoPanel(
      BuildContext context,  GrupoDao grupoDao) {



    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GrupoPanel(
            grupo: grupoDao,
            onTap: () =>
                {Navigator.pushNamed(context, '/local', arguments: grupoDao)},
            height: 230,
            weight: 350),
      ],
    );
  }
  Widget resgatarDados(CollectionReference locais) {
    return StreamBuilder<QuerySnapshot>(
        stream: locais.snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text('Erro ao conectar firestore'));
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return exibitListaDeGrupos(snapshot);
          }
        });
  }


  Widget exibitListaDeGrupos(snapshot){
    final dados = snapshot.requireData;
    return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dados.size,
        itemBuilder: (BuildContext context, int index) {
          return _criarGrupoPanel(context, new GrupoDao(null, dados.docs[index]['nome'], dados.docs[index]['imagem']));
    });
  }

}
