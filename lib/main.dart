import 'package:app_momoveis/screens/login.dart';
import 'package:app_momoveis/screens/responsaveis.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/moveis_grupo.dart';

void main() {
  runApp(MomoveisApp());
}

class MomoveisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/home': (context) => Home(),
        '/grupo': (context) => GrupoMoveis(),
        '/responsaveis': (context) => Responsaveis(),

      },
    );
  }
}
