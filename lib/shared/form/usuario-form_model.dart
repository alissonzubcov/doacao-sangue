class UsuarioFORM {
  String nome;
  String sobrenome;
  String cpf;
  String email;
  String senha;
  String dispositivo;
 
  UsuarioFORM();

  UsuarioFORM.map(Map<String, dynamic> mapa) {
    nome = mapa["nome"];
    sobrenome = mapa["sobrenome"];
    cpf = mapa["cpf"];
    email = mapa["email"];
    senha = mapa["senha"];
    dispositivo = mapa["dispositivo"];
  }

  Map<dynamic, dynamic> converterToMap() {
    Map<dynamic, dynamic> mapa = new Map<dynamic, dynamic>();
    mapa["nome"] = nome;
    mapa["sobrenome"] = sobrenome;
    mapa["cpf"] = cpf;
    mapa["email"] = email;
    mapa["senha"] = senha;
    mapa["dispositivo"] = dispositivo;

    return mapa;
  }


String get getNome => nome;

 set setNome(String nome) => this.nome = nome;

 String get getSobrenome => sobrenome;

 set setSobrenome(String sobrenome) => this.sobrenome = sobrenome;

 String get getCpf => cpf;

 set setCpf(String cpf) => this.cpf = cpf;

 String get getEmail => email;

 set setEmail(String email) => this.email = email;

 String get getSenha => senha;

 set setSenha(String senha) => this.senha = senha;

 String get getDispositivo => dispositivo;

 set setDispositivo(String dispositivo) => this.dispositivo = dispositivo;



}
