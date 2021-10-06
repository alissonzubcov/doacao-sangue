import 'package:flutter/material.dart';
import 'package:semana_info_flutter/data/data.dart';
import 'package:url_launcher/url_launcher.dart';

class CardNoticia extends StatelessWidget {
  final String urlImagem;
  final String textoNoticia;
  final String linkNoticia;

  CardNoticia(this.urlImagem, this.textoNoticia, this.linkNoticia);

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
                    urlImagem,
                    fit: BoxFit.fill,
                  ),
                ),
                new Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    textoNoticia,
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
            //acessa tela de consulta de noticia por id
            // await launch("$linkNoticia");
          },
        )
      ],
    );
  }
}