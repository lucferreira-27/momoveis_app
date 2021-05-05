
import 'package:app_momoveis/screens/formulario_item.dart';

class Item{
    final String nome;
    final String responsavel;
    final ItemTamanho tamanho;
    final bool novo;

  Item(this.nome, this.responsavel, this.tamanho, this.novo);

  @override
  String toString() {
    return "$nome, $responsavel, $tamanho, $novo, ";
  }
}