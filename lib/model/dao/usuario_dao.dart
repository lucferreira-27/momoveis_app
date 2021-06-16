
class UsuarioDao{
  
  String id;
  String username;
  String email;
  String senha;
  String nome;
  String sobrenome;

  UsuarioDao(this.username, this.email, this.senha, this.nome, this.sobrenome);

  UsuarioDao.fromJson(Map<String, dynamic> mapa, String id){
    this.id = id;
    this.nome = mapa ['nome'];
    this.sobrenome = mapa ['sobrenome'];
    this.username = mapa['username'];
    this.email = mapa['email'];
  }

  Map<String, dynamic> toJson(){
      return{
        'id' : this.id,
        'nome' : this.nome,
        'sobrenome' : this.sobrenome,
        'username' : this.username,
        'email' : this.email,
      };
  }
}