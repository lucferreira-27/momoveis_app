import 'package:app_momoveis/components/menu_item.dart';
import 'package:app_momoveis/model/usuario.dart';
import 'package:flutter/material.dart';


const String _appBarTitle = "Menu";
const String _itemGrupoMoveis = "Grupo Móveis";
const String _itemResponsaveis = "Responsaveis";


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Usuario usuario = ModalRoute.of(context).settings.arguments;

 //   String username = usuario == null ? "unknow" : usuario.username;
    String username = usuario.username;

    return Scaffold(
        appBar: AppBar(title: Text(_appBarTitle)),
        backgroundColor: Color.fromRGBO(38, 50, 56, 1),
        body: Column(
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
                  _criarMenuItem(_itemGrupoMoveis, Icons.local_hotel,
                      () => Navigator.pushNamed(context, '/grupo')),
                  SizedBox(height: 20),
                  _criarMenuItem(_itemResponsaveis, Icons.group,
                      () => Navigator.pushNamed(context, '/responsaveis'))
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
