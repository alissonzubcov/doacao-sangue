/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:semana_info_flutter/entitys/user_entity.dart';

class UserModel extends Model {
  static FirebaseMessaging _messaging = new FirebaseMessaging();
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;

  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  String _dispositivoID;
  User usuario;


  // pode usar em qualquer lugar do app (util quando só quer fazer uma verifiçao simples nos atributos)
  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _loadCurrentUser();
    //_messaging.subscribeToTopic("all");
  }

  //   //Cadastrar
  // void signUp(
  //     {@required Map<String, dynamic> userData,
  //     @required String pass,
  //     @required VoidCallback onSucees,
  //     @required VoidCallback onFail}) async {
  //   isLoading = true;

  //   UsuarioFORM usuarioFORM = new UsuarioFORM();
  //   usuarioFORM.nome = userData["name"];
  //   usuarioFORM.sobrenome = userData["sobrenome"];
  //   usuarioFORM.cpf = userData["cpf"];
  //   usuarioFORM.email = userData["email"];
  //   usuarioFORM.senha = pass;
  //   usuarioFORM.dispositivo = _dispositivoID;

  //   notifyListeners();

  //   await UsuarioService.cadastrarIUsuario(usuarioFORM);

  //   _auth
  //       .createUserWithEmailAndPassword(
  //           email: userData["email"], password: pass)
  //       .then((user) async {
  //     firebaseUser = user.user;
  //     userData["UNIQUEID"] = _dispositivoID;
  //     _messaging.subscribeToTopic(userData["cpf"]);
  //     await _saveUserData(userData);

  //     onSucees();
  //     isLoading = false;
  //     notifyListeners();
  //   }).catchError((e) {
  //     onFail();
  //     isLoading = false;
  //     notifyListeners();
  //   });
  // }



    //Entrar
  void signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSucess,
      @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) async {
      firebaseUser = user.user;

      await _loadCurrentUser();
      onSucess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }


  void signOut() async {
    await _auth.signOut();
    userData = Map();
    usuario = null;
    _messaging.unsubscribeFromTopic(userData["cpf"]);
    firebaseUser = null;

    notifyListeners();
  }

  void recoveryPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggeIn() {
    return firebaseUser != null;
  }







    Future<Null> _loadCurrentUser() async {
    if (firebaseUser == null) {
      firebaseUser = await _auth.currentUser();
    }
    if (firebaseUser != null) {
      if (userData["nome"] == null) {
        DocumentSnapshot docUser = await Firestore.instance
            .collection("usuarios")
            .document(firebaseUser.uid)
            .get();
        userData = docUser.data;
      }
    }
    if (firebaseUser != null) {
      if (usuario == null) {
        if (userData != null) {
          //usuario = await UsuarioService.buscarUsuarioByCPF(userData["cpf"]);
          // UsuarioService.buscarUsuarioByCPF(userData["cpf"]).then((value) {
          //   usuario = value;
          //   print(value.id);
          // });
        }
      }
    }
    notifyListeners();
  }


}

*/