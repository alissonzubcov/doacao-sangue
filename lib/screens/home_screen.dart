import 'package:flutter/material.dart';
import 'package:semana_info_flutter/data/data.dart';
import 'package:semana_info_flutter/entitys/noticia_entity.dart';
import 'package:semana_info_flutter/widgets/card_noticia.dart';
import 'package:semana_info_flutter/widgets/drawer_personalizado.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final List<NoticiaEntity> listaNoticias = getDefaultNoticias();

  HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPersonalizado(),
        backgroundColor: Color(0xFF9C1C1D),
        appBar: new AppBar(
          backgroundColor: Color(0xFF9C1C1D),
          centerTitle: true,
          title: Text("Noticias"), //TituloCursoBar(),
        ),
        body: Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(colors: [
          //       //Color(0xFF1b3561),
          //   Color(0xFF1b3561),
          //   Colors.black,
          //   Color(0xFFE51414)
          // ], begin: Alignment.topCenter, end: Alignment.bottomCenter))
          // ,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: listaNoticias
                      .map((e) =>
                          CardNoticia(e.getImagemUrl, e.getTexto, e.getLinkUrl))
                      .toList(),
                ),
              )),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 10),
              //   width: 350,
              //   child: RaisedButton(
              //     color: Color(0xFF1b3561),
              //     child: Text(
              //       "Acessar Site",
              //       style: TextStyle(
              //           fontSize: 25,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white),
              //     ),
              //     onPressed: () async {
              //       await launch("https://www.fema.edu.br");
              //     },
              //   ),
              // )
            ],
          ),
        ));
  }


  Future<void> showMyDialog(context) async {
    Color bgColor = Colors.pink;
    Color fontColor = Colors.white;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bgColor,
          title: Text(
            'Curso de desenvolido por:',
            style: TextStyle(color: fontColor, fontSize: 22),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Alisson Zubcov\nCurso: Ciências da Computação\nAno: 3º\nCanal Youtube: link',
                  style: TextStyle(color: fontColor, fontSize: 18),
                ),
                //Image(fit: BoxFit.cover,image: NetworkImage('https://www.questionpro.com/blog/wp-content/uploads/2015/03/primary-test-it.png'))
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              splashColor: Colors.transparent,
              child: Text(
                'Fechar',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              //Icon(FontAwesomeIcons.checkCircle,color: Colors.white,),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



}


/*
  titulo v1

  Widget titleHome() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 30),
          height: 30,
          child: new Image.network(
            'https://www.fema.edu.br/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        new Text("CURSO FLUTTER",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFFFF)))
      ],
    );
  }

*/


/*
  card Noticia v1

  Widget cardNoticia(
      String urlImagem, String textoNoticia, String linkNoticia) {
    return new Column(
      children: <Widget>[
        new Card(
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
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        RaisedButton(
          color: Colors.orange,
          child: Text(
            "Acessar",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () async {
            await launch("$linkNoticia");
          },
        )
      ],
    );
  }
  */


/*

  drawer versao 1
Drawer(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Icon(
                      Icons.supervised_user_circle,
                      size: 150,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: RaisedButton(
                    color: Colors.deepOrange,
                    child: Text("Entrar", style: TextStyle(fontSize: 25, color: Colors.white)),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text("Sobre", style: TextStyle(fontSize: 25, color: Colors.white)),
                    onPressed: () {},
                  )
                )
              ],
            ),
          ),
        )


*/
