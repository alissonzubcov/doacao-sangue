import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GuiaDoacao extends StatefulWidget {
  @override
  _GuiaDoacaoState createState() => _GuiaDoacaoState();
}

class _GuiaDoacaoState extends State<GuiaDoacao> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("guia_doacao").getDocuments(),
        builder: (context, snapshot) {
           if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Column(children: snapshot.data.documents.map((e) => cardExpand(e)).toList(),
    );
          }
          
        });
  }

  Widget cardExpand(DocumentSnapshot snapshot) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        leading: Icon(FontAwesomeIcons.question),
        trailing: Icon(FontAwesomeIcons.question),
        title: Text(
          snapshot.data['titulo'],
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          textAlign: TextAlign.center,
        ),
        children: <Widget>[
          SizedBox(
              height: 150,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Text(
                  snapshot.data['texto'],
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.justify,
                ),
              ))
        ],
      ),
    );
  }
}
