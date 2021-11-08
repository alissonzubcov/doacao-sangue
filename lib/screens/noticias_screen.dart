import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:semana_info_flutter/data/data.dart';
import 'package:semana_info_flutter/entitys/noticia_entity.dart';
import 'package:semana_info_flutter/widgets/card_noticia.dart';
import 'package:semana_info_flutter/widgets/drawer_personalizado.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiasScreen extends StatelessWidget {
  final List<NoticiaEntity> listaNoticias = getDefaultNoticias();

  NoticiasScreen();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("noticias").getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: snapshot.data.documents
                              .map((e) => CardNoticia(e))
                              .toList(),
                        ),
                      )),
                    ],
                  ),
                );
          }
        });
  }
}
