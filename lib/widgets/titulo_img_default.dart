import 'package:flutter/material.dart';

class TituloImgDefault extends StatelessWidget {
  final String titulo;
  final String url;

  TituloImgDefault(this.titulo, this.url);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 30),
          height: 30,
          child: 
          // new Image.asset(
          //   'assets/img/logo.png',
          //   fit: BoxFit.fill,
          //   width: 110,)
          new Image.network(url,fit: BoxFit.cover
          ),
        ),
         // new Image.network('https://www.fema.edu.br/images/logo.png',fit: BoxFit.cover,),
          //new Image.network(url,fit: BoxFit.cover,),
        Container(
          padding: EdgeInsets.only(top: 7),
          child: new Text(titulo,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFFFF))),
        )
      ],
    );
  }
}
