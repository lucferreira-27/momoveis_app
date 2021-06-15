import '../item.dart';
import 'item_dao.dart';

class GrupoDao{
   String id;
   String nome;
   String image;
  GrupoDao(this.id, this.nome, this.image);

  GrupoDao.fromJson(Map<String, dynamic> mapa, String id){
    this.id = id;
    this.nome = mapa ['nome'];
    this.image = mapa ['image'];
  }

  Map<String, dynamic> toJson(){
      return{
        'id' : this.id,
        'nome' : this.nome,
        'image' : this.image
      };
  }

}