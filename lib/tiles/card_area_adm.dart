import 'package:flutter/material.dart';
import 'package:semana_info_flutter/model/user_model.dart';
import 'package:semana_info_flutter/screens/area_adm_screen.dart';
import 'package:semana_info_flutter/screens/noticia_registrar_screen.dart';

//import 'package:transparent_image/transparent_image.dart';

class CardAreaAdmTile extends StatelessWidget {
final String nome;
final MenuAdm acao;

CardAreaAdmTile(this.nome, this.acao);

  @override
  Widget build(BuildContext context) {
    return itemCategoria(context, this.nome);
  }

  Widget itemCategoria(BuildContext context, String nome, ) {
    //var _size = MediaQuery.of(context).size;
    return Material(
      color:  
       Color(0xFF9C1C1D),
      child: InkWell(
        onTap: () {

          switch (acao){
            case MenuAdm.REGISTRAR_NOTICIA:
                    Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NoticiaRegistroScreen()));
            break;
          }

          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => CategoriaScreen(categoria)));
        },
        child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                //  color: Color(0xFFFFFFFF),
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 3)),
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                        child: Text(
                          nome,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // fontFamily: 'editundo',
                              
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                );
              },
            )),
      ),
    );
  }
}
