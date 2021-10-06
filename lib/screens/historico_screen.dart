import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:semana_info_flutter/screens/historico_registrar_screen.dart';

class HistoricoScreen extends StatefulWidget {
  @override
  _HistoricoScreenState createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF9C1C1D),
          title: Text("Histórico"),
          centerTitle: true,
          actions: <Widget>[],
        ),
        backgroundColor: Color(0xFF9C1C1D),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [cardItemHistorico()],
              ),
            )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HistoricoRegistroScreen(),
                    ))
          },
          backgroundColor: Colors.red,
          child: Icon(FontAwesomeIcons.plus),
        ),
        );
  }

  Widget cardItemHistorico() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: Color(0xffD61E23),
      child: Center(
          child: Row(
        children: [
          Expanded(
              child: Container(
                height: 80,
            child: Column(
              children: [Text("Data", style: TextStyle(fontSize: 25, color: Colors.white ),), Text("10/10/2021", style: TextStyle(fontSize: 25, color: Colors.white)), ],
            ),
          )),
          Container(
            margin: EdgeInsets.only(right: 5),
            child: InkWell(
            child: Icon(FontAwesomeIcons.trashAlt, color: Colors.white),
            onTap: (){
              print("Clicou");
            },
          ),
          )
        ],
      )),
    );
  }
}
