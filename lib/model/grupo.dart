import 'package:flutter/material.dart';

import 'item.dart';

class Grupo {
  final String nome;
  final List<Item> items = [];
  final String image;
  Grupo(this.nome, this.image);

  @override
  String toString() {
    // TODO: implement toString
    return "$nome, ${items.length}, $image";
  }
  
}