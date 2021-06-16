import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../dao/usuario_dao.dart';

class Auth {

    criarNovaConta(UsuarioDao usuario, cadastro, onError){
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usuario.email, 
        password: usuario.senha).then((cadastro)).catchError(onError);
    }

    login(email, senha, login, onError){
      FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, 
      password: senha).then(login).catchError(onError);
    }
}