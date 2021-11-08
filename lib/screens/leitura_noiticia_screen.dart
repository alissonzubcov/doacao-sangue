import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:semana_info_flutter/data/data.dart';
import 'package:semana_info_flutter/screens/noticias_screen.dart';

class LeituraNoticia extends StatelessWidget {
  final DocumentSnapshot snapshot;

  LeituraNoticia(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9C1C1D),
        title: Text(snapshot.data['titulo']),
        centerTitle: true,
        actions: <Widget>[],
      ),
      backgroundColor: Color(0xFF9C1C1D),
      body: Column(
        children: <Widget>[
          Expanded(
              child: new Card(
            color: getBackGroundColor2(),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              width: 400,
              child: SingleChildScrollView(
                child: new Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      snapshot.data['texto'],
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      textAlign: TextAlign.justify
                    ),
                  ),
              ),
            ),
          )),
          RaisedButton(
            color: Color(0xFFFFFFFF),
            child: Text(
              "Fechar",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            onPressed: () async {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => NoticiasScreen(),
              ));
            },
          )
        ],
      ),
    );
  }
}
