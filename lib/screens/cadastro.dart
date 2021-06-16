import 'package:app_momoveis/components/campo.dart';
import 'package:app_momoveis/model/service/auth.dart';
import 'package:app_momoveis/model/dao/usuario_dao.dart';
import 'package:app_momoveis/model/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const String _appBarTitle = "Cadastro de Conta";
const String _btnCadastrar = "Cadastrar";
const String _lblUsuario = "Usuário";
const String _lblSenha = "Senha";
const String _lblEmail = "Email";
const String _lblNome = "Nome";
const String _lblSobrenome = "Sobrenome";

const String _logoCaminho = "images/logo.png";
Auth auth = new Auth();

class Cadastro extends StatelessWidget {
  final TextEditingController _controllerSobrenome =
      new TextEditingController();
  final TextEditingController _controllerNome = new TextEditingController();
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerUsuario = new TextEditingController();
  final TextEditingController _controllerSenha = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Usuario _usuario = new Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(_appBarTitle), automaticallyImplyLeading: true),
      body: Container(
        child: ListView(
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
                child: Column(
                  children: [
                  Campo(
                    label: _lblUsuario,
                    controller: _controllerUsuario,
                    campoValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${_lblUsuario} não pode estar vazio!';
                      } else {
                        _usuario.username = value;
                        return null;
                      }
                    },
                  ),
                  Campo(
                    label: _lblEmail,
                    controller: _controllerEmail,
                    campoValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${_lblEmail} não pode estar vazio!';
                      } else if (_emailValidado(value)) {
                        _usuario.email = value;
                        return null;
                      }
                      return 'Porfavor insira um email valido!';
                    },
                  ),
                  Campo(
                    label: _lblSenha,
                    controller: _controllerSenha,
                    hide: true,
                    campoValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${_lblSenha} não pode estar vazio!';
                      } else {
                        _usuario.senha = value;

                        return null;
                      }
                    },
                  ),
                  Campo(
                    label: _lblNome,
                    controller: _controllerNome,
                    hide: false,
                    campoValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${_lblNome} não pode estar vazio!';
                      } else {
                        _usuario.nome = value;
                        return null;
                      }
                    },
                  ),
                  Campo(
                    label: _lblSobrenome,
                    controller: _controllerSobrenome,
                    hide: false,
                    campoValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${_lblSobrenome} não pode estar vazio!';
                      } else {
                        _usuario.sobrenome = value;
                        return null;
                      }
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
                          child: Text(_btnCadastrar),
                          onPressed: () => _registrar(context))),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _emailValidado(email) {
    var regex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    bool emailValidado = RegExp(regex).hasMatch(email);
    return emailValidado;
  }

  _registrar(BuildContext context) {
    if (_formKey.currentState.validate()) {
      UsuarioDao usuarioDao = new UsuarioDao(_usuario.username, _usuario.email,
          _usuario.senha, _usuario.nome, _usuario.sobrenome);

      auth.criarNovaConta(usuarioDao, (result) {
        _salvarUsuario(usuarioDao);
        Navigator.pushNamed(context, '/login');
        _exibirMensagemDeSucessoCadastro(context);
      }, (error) {
        var msg = _cadastroInformarErro(error.code);
        return _exibirMensagemDeFalhoCadastro(msg, context);
      });
    }
  }

  _exibirMensagemDeSucessoCadastro(context) {
    String snackMsg = "Conta criado com sucesso!";
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(snackMsg)));
  }

  _exibirMensagemDeFalhoCadastro(msg, context) {
    String snackMsg = "Falhou: " + msg;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(snackMsg)));
  }

  String _cadastroInformarErro(erro) {
    var msg = '';

    if (erro == 'email-already-in-use') {
      msg = "Email já está em uso";
    } else {
      msg = erro;
    }
    return msg;
  }
}

void _salvarUsuario(UsuarioDao usuarioDao) {
  FirebaseFirestore.instance.collection("usuarios").add(usuarioDao.toJson());
}
