import 'package:flutter/material.dart';
import 'package:semana_info_flutter/tiles/card_area_adm.dart';

class AreaAdmScreen extends StatefulWidget {

  @override
  _AreaAdmScreenState createState() => _AreaAdmScreenState();
}

class _AreaAdmScreenState extends State<AreaAdmScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
              crossAxisCount: 2,
              
              children: [
                  CardAreaAdmTile("Registrar Noticia", MenuAdm.REGISTRAR_NOTICIA),
                  CardAreaAdmTile("Registrar Notificação", MenuAdm.REGISTRAR_NOTICIA ),
                  CardAreaAdmTile("Promover Campanha", MenuAdm.REGISTRAR_NOTICIA),
                  CardAreaAdmTile("Questionário Doador", MenuAdm.REGISTRAR_NOTICIA),
                  CardAreaAdmTile("Guia de Doação", MenuAdm.REGISTRAR_NOTICIA),
              ],
            );
  }
}

enum MenuAdm{
  REGISTRAR_NOTICIA,
  REGISTRAR_NOTIFICACAO,
  PROMOVER_CAMAPANHA,
  QUESTIONARIO_DOADOR,
  GUIA_DOACAO
}