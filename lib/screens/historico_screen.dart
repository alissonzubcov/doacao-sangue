import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:semana_info_flutter/model/user_model.dart';
import 'package:semana_info_flutter/screens/login_screen.dart';

class HistoricoScreen extends StatefulWidget {
  @override
  _HistoricoScreenState createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  @override
  Widget build(BuildContext context) {
    if (UserModel.of(context).isLoggedIn()) {
      String uid = UserModel.of(context).firebaseUser.uid;
      return FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection("usuarios")
              .document(uid)
              .collection("historico")
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: snapshot.data.documents
                          //.map((e) => cardItemHistorico(e['data'], e['observacao']))
                          .map((e) => cardItemHistorico(e))
                          .toList(),
                    ),
                  )),
                ],
              );
            }
          });
    } else {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.login,
              size: 80.0,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Faça o login para acompanhar!",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
              child: Text(
                "Entrar",
                style: TextStyle(fontSize: 18.0),
              ),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            )
          ],
        ),
      );
    }
  }

  Widget cardItemHistorico(DocumentSnapshot data) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: Color(0xffD61E23),
      child: Center(
          child: Row(
        children: [
          Expanded(
              child: Container(
            height: 100,
            child: Column(
              children: [
                Text(
                  "Data",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text(data['data'],
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Local - ',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    Text(data['local'],
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ],
                )
              ],
            ),
          )),
          Container(
            margin: EdgeInsets.only(right: 5),
            child: InkWell(
              child: Icon(FontAwesomeIcons.trashAlt, color: Colors.white),
              onTap: () {
                UserModel.of(context).removeHistorico(data.documentID);
              },
            ),
          )
        ],
      )),
    );
  }
}
