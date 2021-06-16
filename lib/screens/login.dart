import 'package:app_momoveis/components/campo.dart';
import 'package:app_momoveis/model/service/auth.dart';
import 'package:app_momoveis/model/dao/usuario_dao.dart';
import 'package:app_momoveis/model/usuario.dart';
import 'package:flutter/material.dart';

const String _appBarTitle = "Login";
const String _btnLogin = "Login";
const String _btnCadastro = "Cadastrar";
const String _lblUsuario = "Email";
const String _lblSenha = "Senha";

const String _logoCaminho = "images/logo.png";
Auth auth = new Auth();

class Login extends StatelessWidget {
  final TextEditingController _controllerUsuario = new TextEditingController();
  final TextEditingController _controllerSenha = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Usuario _usuario = new Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(_appBarTitle), automaticallyImplyLeading: false),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(50),
              child: Image(image: AssetImage(_logoCaminho)),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(50),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Campo(
                    label: _lblUsuario,
                    controller: _controllerUsuario,
                    campoValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo não pode estar vazio!';
                      } else if (_verificaUsuario(value)) {
                        _usuario.email = value;
                        return null;
                      }
                      return "{$_lblUsuario} incorreto!";
                    },
                  ),
                  Campo(
                    label: _lblSenha,
                    controller: _controllerSenha,
                    hide: true,
                    campoValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo não pode estar vazio!';
                      } else if (_verificaSenha(value)) {
                        return null;
                      }
                      return "{$_lblSenha} incorreto!";
                    },
                  ),
                  SizedBox(
                      width: 375,
                      height: 62,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(38, 50, 56, 1)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.only(top: 10)),
                              textStyle: MaterialStateProperty.all(
                                  TextStyle(fontSize: 25))),
                          child: Text(_btnLogin),
                          onPressed: () => _login(context))),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SizedBox(
                        width: 175,
                        height: 32,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.only(top: 10)),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 16))),
                            child: Text(_btnCadastro),
                            onPressed: () => _cadastrar(context))),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  _cadastrar(context) {
    Navigator.pushNamed(context, '/cadastro');
  }

  _login(BuildContext context) {
    if (_formKey.currentState.validate()) {
      String senha = _controllerSenha.text;
      String email = _usuario.email;

      auth.login(email, senha, (result) {
        Navigator.pushNamed(context, '/home', arguments: _usuario);
        _exibirMensagemDeSucessoLogin(email, context);
      }, (error) {
        var msg = _loginInformarErro(error.code);
        return _exibirMensagemDeFalhoLogin(msg, context);
      });
    }
  }

  _verificaSenha(String senha) {
    /*
    if (senha == "adm") {
      return true;
    }
    
    return false;
    */
    return true;
  }

  _verificaUsuario(String usuario) {
    /*
    if (usuario == "adm") {
      return true;
    }
    return false;
  
  */
    return true;
  }

  _exibirMensagemDeSucessoLogin(email, context) {
    String snackMsg = "Bem-vindo " + email;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(snackMsg)));
  }

  _exibirMensagemDeFalhoLogin(msg, context) {
    String snackMsg = "Falhou: " + msg;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(snackMsg)));
  }

  String _loginInformarErro(erro) {
    var msg = '';

    if (erro == 'user-not-foud') {
      msg = "Usuário não existe!";
    } else {
      msg = "Senha ou/e Email incorretos";
    }
    return msg;
  }
}
