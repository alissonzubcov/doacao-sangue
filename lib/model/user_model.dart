import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:semana_info_flutter/shared/form/usuario-form_model.dart';
import 'package:semana_info_flutter/shared/model/usuario_model.dart';

class UserModel extends Model {
  static FirebaseMessaging _messaging = new FirebaseMessaging();
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;

  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  String _dispositivoID;
  Usuario usuario;

  // pode usar em qualquer lugar do app (util quando só quer fazer uma verifiçao simples nos atributos)
  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _loadCurrentUser();
    _getId();
    //_messaging.subscribeToTopic("all");
  }

  //Cadastrar
  void signUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;

    UsuarioFORM usuarioFORM = new UsuarioFORM();
    usuarioFORM.nome = userData["name"];
    usuarioFORM.sobrenome = userData["sobrenome"];
    usuarioFORM.cpf = userData["cpf"];
    usuarioFORM.email = userData["email"];
    usuarioFORM.senha = pass;
    usuarioFORM.dispositivo = _dispositivoID;

    notifyListeners();

    // await UsuarioService.cadastrarIUsuario(usuarioFORM);

    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((user) async {
      firebaseUser = user.user;
      userData["UNIQUEID"] = _dispositivoID;
      // _messaging.subscribeToTopic(userData["cpf"]);

      await _saveUserData(userData);

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  //Entrar
  void signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) async {
      firebaseUser = user.user;

      await _loadCurrentUser();

      onSuccess();
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
    // _messaging.unsubscribeFromTopic(userData["cpf"]);
    firebaseUser = null;

    notifyListeners();
  }

  void recoveryPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggeIn() {
    return firebaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection("usuarios")
        .document(firebaseUser.uid)
        .setData(userData);
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
        // usuario = docUser.data;
      }
    }

    notifyListeners();
  }

  void recoverPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  Future<String> _getId() async {
    String _idAndoid;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    _idAndoid = androidDeviceInfo.androidId;
    _dispositivoID = _idAndoid;
    return _idAndoid; // unique ID on Android

    /*
   if (Theme.of(context).platform == TargetPlatform.iOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    // sorce android
    }
  */
  }

// TODO - mover

  void addHistorico(HistoricoRegistrar historicoRegistrar) {
    Firestore.instance
        .collection("usuarios")
        .document(firebaseUser.uid)
        .collection("historico")
        .add(historicoRegistrar.toMap())
        .then((doc) {});

    notifyListeners();
  }

  void removeHistorico(String cid) async {
    Firestore.instance
        .collection("usuarios")
        .document(firebaseUser.uid)
        .collection("historico")
        .document(cid)
        .delete();
    notifyListeners();
  }

  void addNoticia(NoticiaRegistrar noticiaRegistrar) {
    Firestore.instance
        .collection("noticias")
        .add(noticiaRegistrar.toMap())
        .then((doc) {});
    notifyListeners();
  }

  void removeNoticia(String cid) async {
    Firestore.instance.collection("noticias").document(cid).delete();
    notifyListeners();
  }
}

class HistoricoRegistrar {
  String data;
  String observacao;
  String local;

  HistoricoRegistrar();

  HistoricoRegistrar.fromDocument(DocumentSnapshot snapshot) {
    // id = snapshot.documentID;
    data = snapshot.data["data"];
    observacao = snapshot.data["observacao"];
    local = snapshot.data["local"];
    // adicionais = snapshot.data["adicionais"];
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'observacao': observacao,
      'local': local,
    };
  }
}

class NoticiaRegistrar {
  String id;
  String titulo;
  String imagemUrl;
  String texto;
  String resumo;

  NoticiaRegistrar();

  NoticiaRegistrar.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    titulo = snapshot.data["titulo"];
    imagemUrl = snapshot.data["imagemUrl"];
    texto = snapshot.data["texto"];
    resumo = snapshot.data["resumo"];
    // adicionais = snapshot.data["adicionais"];
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'imagemUrl': imagemUrl,
      'texto': texto,
      'resumo': resumo
    };
  }
}
