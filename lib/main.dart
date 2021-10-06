import 'package:flutter/material.dart';
import 'package:semana_info_flutter/entitys/noticia_entity.dart';
import 'package:semana_info_flutter/screens/historico_registrar_screen.dart';
import 'package:semana_info_flutter/screens/historico_screen.dart';
import 'package:semana_info_flutter/screens/home_screen.dart';
import 'package:semana_info_flutter/screens/questionario_screen.dart';
import 'package:semana_info_flutter/screens/realizar_doacao_screen.dart';

void main() {
  runApp(MeuAplicativo());
  // Firestore.instance.collection('test').document('testIN').setData({'msg': 'ok'});
}

class MeuAplicativo extends StatefulWidget {
  @override
  _MeuAplicativoState createState() => _MeuAplicativoState();
}

class _MeuAplicativoState extends State<MeuAplicativo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     debugShowCheckedModeBanner: false,
    //     //HomeScreen(listaNoticias) //Container(),
    //     home: ScopedModel<UserModel>(
    //       model: UserModel(),
    //       child: ScopedModelDescendant<UserModel>(
    //         builder: (context, child, model) {
    //           return HomeScreen(listaNoticias);
    //         },
    //       ),
    //     ));

    return MaterialApp(
      
      title: 'Flutter Demo',
        theme: ThemeData(
          // primaryColor: Color(0xFF9C1C1D),
          primarySwatch: Colors.blue,
          backgroundColor: Color(0xFF9C1C1D)
        ),
        debugShowCheckedModeBanner: false,
        //HomeScreen(listaNoticias) //Container(),
        home: HomeScreen() //HomeScreen(listaNoticias)
    );
  }
}
