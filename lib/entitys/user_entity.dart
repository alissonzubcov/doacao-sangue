class User{

  int id;
	String nome;
  String sobrenome;
  String cpf;
  String email;
  String dispositivo;

  User();

  User.map(Map<String, dynamic> mapa) {
    id = mapa["id"];
    nome = mapa["nome"];
    sobrenome = mapa["sobrenome"];
    cpf = mapa["cpf"];
    email = mapa["email"];
    dispositivo = mapa["dispositivo"];
  }



}