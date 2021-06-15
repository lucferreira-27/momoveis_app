import '../item.dart';

class ItemDao{

     String id;
     String nome;
     String local;
     String responsavel;
     String tamanho;
     bool novo;



  ItemDao(this.nome, this.responsavel, this.tamanho, this.novo);
  
  ItemDao.fromJson(Map<String, dynamic> mapa, String id){
    this.id = id;
    this.nome = mapa ['nome'];
    this.responsavel = mapa ['responsavel'];
    this.tamanho = mapa['tamanho'];
    this.novo = mapa['novo'];
    this.local = mapa['local'];
  }

  Map<String, dynamic> toJson(){
      return{
        'id' : this.id,
        'nome' : this.nome,
        'responsavel' : this.responsavel,
        'tamanho' : this.tamanho,
        'novo' : this.novo,
        'local' : this.local
      };
  }

}