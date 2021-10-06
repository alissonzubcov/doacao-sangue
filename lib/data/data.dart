import 'dart:ui';

import 'package:semana_info_flutter/entitys/noticia_entity.dart';

List<NoticiaEntity> getDefaultNoticias(){
    // ignore: deprecated_member_use
    List<NoticiaEntity> listaNoticias = new List<NoticiaEntity>();

  listaNoticias.add(NoticiaEntity.padrao(
        "Titulo",
        "Saiba os pontos de coleta de sangue disponíveis",
        "https://sciath.com.br/wp-content/uploads/2020/06/doacao-sangue.jpg",
        "https://www.fema.edu.br/index.php/noticias-pagina/1754-atual-diretoria-do-imesa-completa-dois-anos"));
    listaNoticias.add(NoticiaEntity.padrao(
        "Titulo",
        "Saiba os pontos de coleta de sangue disponíveis",
        "https://sciath.com.br/wp-content/uploads/2020/06/doacao-sangue.jpg",
        "https://www.fema.edu.br/index.php/noticias-pagina/1754-atual-diretoria-do-imesa-completa-dois-anos"));
    listaNoticias.add(NoticiaEntity.padrao(
        "Titulo",
        "Saiba os pontos de coleta de sangue disponíveis",
        "https://sciath.com.br/wp-content/uploads/2020/06/doacao-sangue.jpg",
        "https://www.fema.edu.br/index.php/noticias-pagina/1754-atual-diretoria-do-imesa-completa-dois-anos"));
    listaNoticias.add(NoticiaEntity.padrao(
        "Titulo",
        "Saiba os pontos de coleta de sangue disponíveis",
        "https://sciath.com.br/wp-content/uploads/2020/06/doacao-sangue.jpg",
        "https://www.fema.edu.br/index.php/noticias-pagina/1754-atual-diretoria-do-imesa-completa-dois-anos"));
  
  return listaNoticias;
}


Color getBackGroundColor(){
return Color(0xFF9C1C1D);
}

Color getBackGroundColor2(){
return Color(0xffD61E23);
}