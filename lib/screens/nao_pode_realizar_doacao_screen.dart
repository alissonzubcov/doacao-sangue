import 'package:flutter/material.dart';
import 'package:semana_info_flutter/screens/home_screen.dart';

class NaoPodeRealizarDoacaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Informativo"),
          centerTitle: true,
          actions: <Widget>[],
        ),
        backgroundColor: Colors.blue,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Infelizmente pelos motivos descritos abaixo, a doação de sangue não podera ocorrer..',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    Text(
                    'Motivo 1:.',
                    style: TextStyle(fontSize: 25, color: Colors.white))
                  ],
                )
                ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ))
                    },
                child: Text('Fechar'))
          ],
        ));
  }
}
