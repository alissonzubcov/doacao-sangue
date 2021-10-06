import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GuiaDoacao extends StatefulWidget {
  @override
  _GuiaDoacaoState createState() => _GuiaDoacaoState();
}

class _GuiaDoacaoState extends State<GuiaDoacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF9C1C1D),
        centerTitle: true,
        title: Text("Guia de Doação"),
      ),
      backgroundColor: Color(0xFF9C1C1D),
      body: Column(children: <Widget>[
        cardExpand("O que fazer antes?", "dasdas",
            Icon(FontAwesomeIcons.question), Icon(FontAwesomeIcons.question)),
        cardExpand("O que fazer durante?", "dasdas",
            Icon(FontAwesomeIcons.question), Icon(FontAwesomeIcons.question)),
        cardExpand("O que fazer depois?", "dasdas",
            Icon(FontAwesomeIcons.question), Icon(FontAwesomeIcons.question)),
      ]),
    );
  }

  Widget cardExpand(
      String title, String conteudo, Icon leading, Icon trailing) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        leading: leading,
        trailing: trailing,
        title: Text(
          title,
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
                  'ddas das as das dasasdasd asdas asdas as dasd as das das asdas asasd as',
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }
}
