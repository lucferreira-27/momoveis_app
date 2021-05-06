import 'package:app_momoveis/components/menu_item.dart';
import 'package:app_momoveis/model/imovel.dart';
import 'package:app_momoveis/model/usuario.dart';
import 'package:flutter/material.dart';

const String _appBarTitle = "Menu";
const String _itemGrupoMoveis = "Local";
const String _itemResponsaveis = "Responsaveis";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Usuario usuario = ModalRoute.of(context).settings.arguments;
    final Imovel imovel = new Imovel([]);
    //   String username = usuario == null ? "unknow" : usuario.username;
    String username = usuario.username;

    return Scaffold(
        appBar:
            AppBar(title: Text(_appBarTitle), automaticallyImplyLeading: false),
        backgroundColor: Color.fromRGBO(38, 50, 56, 1),
        body: ListView(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  child: Icon(
                    Icons.account_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                Text(
                  username,
                  style: TextStyle(fontSize: 36),
                )
              ],
            ),
            Container(
              child: Column(
                children: [
                  _criarMenuItem(
                      _itemGrupoMoveis,
                      Icons.local_hotel,
                      () => Navigator.pushNamed(context, '/grupos',
                              arguments: imovel)
                          .then((imovelRecebido) =>
                              {imovel.grupos.setAll(0, imovelRecebido)})),
                  SizedBox(height: 20),
                  _criarMenuItem(
                      "Itens",
                      Icons.list,
                      () => Navigator.pushNamed(context, '/itens',
                          arguments: imovel)),
                  SizedBox(height: 20),
                  _criarMenuItem(
                      _itemResponsaveis,
                      Icons.group,
                      () => Navigator.pushNamed(context, '/responsaveis',
                          arguments: imovel)),
                  SizedBox(height: 20),
                  _criarMenuItem("Sobre", Icons.info,
                      () => Navigator.pushNamed(context, '/sobre')),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ));
  }

  _criarMenuItem(String nome, IconData icon, Function onPress) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MenuItem(
          nome: nome,
          icon: icon,
          onPress: onPress,
        ),
      ],
    );
  }
}
