import 'package:flutter/material.dart';
import 'package:semana_info_flutter/screens/home_screen.dart';
import 'package:semana_info_flutter/screens/noticias_screen.dart';

class RealizarDoacaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF9C1C1D),
          title: Text("Realizar Doação"),
          centerTitle: true,
          actions: <Widget>[],
        ),
        backgroundColor: Color(0xFF9C1C1D),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Diriga-se no endereço #endereco para realização da doação.',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Text(
                    'O questionário é apenas uma etapa para filtrar candidados, existe outra fase de perguntas que ocorre no hospital.',
                    style: TextStyle(fontSize: 25, color: Colors.white))),
            ElevatedButton(
                onPressed: () => {
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //   builder: (context) => NoticiasScreen(),
                      // ))
                      //Navigator.of(context).pop(),
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ))
                    },
                child: Text('Fechar'))
          ],
        ));
  }
}
