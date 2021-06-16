import 'package:app_momoveis/screens/cadastro.dart';
import 'package:app_momoveis/screens/editar_item.dart';
import 'package:app_momoveis/screens/formulario_item.dart';
import 'package:app_momoveis/screens/home.dart';
import 'package:app_momoveis/screens/local.dart';
import 'package:app_momoveis/screens/login.dart';
import 'package:app_momoveis/screens/visualizar_grupos.dart';
import 'package:app_momoveis/screens/visualizar_responsaveis.dart';
import 'package:app_momoveis/screens/sobre.dart';
import 'package:flutter/material.dart';
import 'screens/visualizar_items.dart';

void main()  {
 // WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();

 runApp(MomoveisApp());

}

class MomoveisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(14, 77, 164, 1),
        accentColor: Color.fromRGBO(38, 50, 56, 1),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromRGBO(38, 50, 56, 1),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Login(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/cadastro': (context) => Cadastro(),
        '/home': (context) => Home(),
        '/grupos': (context) => GrupoMoveis(),
        '/local': (context) => GrupoLocal(),
        '/responsaveis': (context) => Responsaveis(),
        '/itens': (context) => VisualizarItems(),
        '/formulario': (context) => FormularioItem(),
        '/editarItem': (context) => EditarItem(),
        '/sobre': (context) => Sobre(),
      },
    );
  }
}
