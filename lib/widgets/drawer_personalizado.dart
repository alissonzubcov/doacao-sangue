import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:semana_info_flutter/screens/guia_doacao_.dart';
import 'package:semana_info_flutter/screens/historico_screen.dart';
import 'package:semana_info_flutter/screens/home_screen.dart';
import 'package:semana_info_flutter/screens/questionario_screen.dart';

class DrawerPersonalizado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF9C1C1D), Color(0xffD61E23)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Text(
                          'SONIC',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Image.network(
                          'https://www.clipartmax.com/png/middle/283-2835322_baby-sonic-by-hulkkidgaming-cartoon.png',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50)
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    itemMenu(context, HomeScreen(), FontAwesomeIcons.home,
                        "Home"),
                    itemMenu(context, QuetionarioScreen(),
                        FontAwesomeIcons.tint, "Doar Sangue"),
                    itemMenu(context, GuiaDoacao(), FontAwesomeIcons.book,
                        "Guia De doação"),
                    itemMenu(context, HistoricoScreen(),
                        FontAwesomeIcons.calendarAlt, "Histórico"),
                  ],
                ),
              )),
              InkWell(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.signInAlt,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Sair",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget itemMenu(
      BuildContext context, Widget page, IconData icon, String text) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ))
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Text(text, style: TextStyle(fontSize: 25, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
