import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:semana_info_flutter/data/data.dart';
import 'package:semana_info_flutter/screens/leitura_noiticia_screen.dart';

class CardNoticia extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CardNoticia(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Card(
          color: getBackGroundColor2(),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 400,
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                    snapshot.data['imagemUrl'],
                    fit: BoxFit.fill,
                  ),
                ),
                new Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    snapshot.data['titulo'],
                    style: TextStyle(fontSize: 22, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        RaisedButton(
          color: Color(0xFFF37021),
          child: Text(
            "Acessar",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LeituraNoticia(snapshot),
            ));
          },
        )
      ],
    );
  }
}
