import 'package:flutter/material.dart';


const String _appTitle = "Sobre";
const String _logoCaminho = "images/logo.png";
const String _devCaminho = "images/dev.png";
const String _sobreTitulo = "Sobre";
const String _devTitulo = "Desenvolvedor";
const String _sobre =
    "Momoveis é um app criado para auxiliar pesssoas que desejam registrar o local dos moveis de uma casa assim como o responsável pelo movel (dono).";
const String _devNome = "Lucas Ferreira da Silva";
const String _devFaculdade = "Aluno na Fatec Ribeirão Preto";

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
      ),
      backgroundColor: Color.fromRGBO(38, 50, 56, 1),
      body: Container(
          child: Column(children: [
        adicionarLogo(),
        adicionarCardSobre(),
        adicionarCardDesenvolvedor()
      ])),
    );
  }

  adicionarLogo() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(50),
      child: Image(image: AssetImage(_logoCaminho)),
    );
  }

  adicionarCardSobre() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _sobreTitulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(
                  _sobre,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )),
              ],
            ),
          )
        ],
      ),
      margin: EdgeInsets.only(bottom: 15),
      width: 440,
      height: 133,
      decoration: BoxDecoration(
          color: Color.fromRGBO(14, 77, 164, 1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 2,
          )),
    );
  }

  adicionarCardDesenvolvedor() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _devTitulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(_devCaminho),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 40, 10, 15),
                child: Column(
                  children: [
                    Text(
                      _devNome,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      _devFaculdade,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      width: 384,
      height: 205,
      decoration: BoxDecoration(
          color: Color.fromRGBO(14, 77, 164, 1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 2,
          )),
    );
  }
}
