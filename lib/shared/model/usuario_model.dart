class Usuario{
  int id;
	String nome;
  String sobrenome;
  String cpf;
  String email;
  String dispositivo;

  Usuario();

  Usuario.map(Map<String, dynamic> mapa) {
    id = mapa["id"];
    nome = mapa["nome"];
    sobrenome = mapa["sobrenome"];
    cpf = mapa["cpf"];
    email = mapa["email"];
    dispositivo = mapa["dispositivo"];
  }



 int get getId => id;

 set setId(int id) => this.id = id;

 String get getNome => nome;

 set setNome(String nome) => this.nome = nome;

 String get getSobrenome => sobrenome;

 set setSobrenome(String sobrenome) => this.sobrenome = sobrenome;

 String get getCpf => cpf;

 set setCpf(String cpf) => this.cpf = cpf;

 String get getEmail => email;

 set setEmail(String email) => this.email = email;

 String get getDispositivo => dispositivo;

 set setDispositivo(String dispositivo) => this.dispositivo = dispositivo;

}

