import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:semana_info_flutter/model/user_model.dart';
import 'package:semana_info_flutter/screens/login_screen.dart';
import 'package:semana_info_flutter/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF9C1C1D), Color(0xffD61E23)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          Column(
            // padding: EdgeInsets.only(left: 32.0, top: 16.0),
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Container(
                // margin: EdgeInsets.only(bottom: 8.0),
                // padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 110.0,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5, top: 0),
                      child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model) {
                        return Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                child: Text(
                                  "${!model.isLoggedIn() ? "SONIC" : model.userData["name"]}",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                              Image.network(
                                  'https://www.clipartmax.com/png/middle/283-2835322_baby-sonic-by-hulkkidgaming-cartoon.png',
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50)
                            ],
                          ),
                        );
                      }),
                    ),
                    // Positioned(
                    //     left: 0.0,
                    //     bottom: 0.0,
                    //     child: ScopedModelDescendant<UserModel>(
                    //       builder: (context, child, model) {
                    //         return Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: <Widget>[
                    //             Text(
                    //               "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                    //               style: TextStyle(
                    //                   fontSize: 18.0,
                    //                   fontWeight: FontWeight.bold),
                    //             ),
                    //             GestureDetector(
                    //               child: Text(
                    //                 !model.isLoggedIn()
                    //                     ? "Entre ou cadastre-se >"
                    //                     : "Sair",
                    //                 style: TextStyle(
                    //                     color: Theme.of(context).primaryColor,
                    //                     fontSize: 16.0,
                    //                     fontWeight: FontWeight.bold),
                    //               ),
                    //               onTap: () {
                    //                 if (!model.isLoggedIn())
                    //                   Navigator.of(context).push(
                    //                       MaterialPageRoute(
                    //                           builder: (context) =>
                    //                               LoginScreen()));
                    //                 else
                    //                   model.signOut();
                    //               },
                    //             )
                    //           ],
                    //         );
                    //       },
                    //     ))
                  ],
                ),
              ),
              // Divider(color: Colors.white,),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  DrawerTile(
                      FontAwesomeIcons.home, "Notícias", pageController, 0),
                  DrawerTile(
                      FontAwesomeIcons.tint, "Doar Sangue", pageController, 1),
                  DrawerTile(FontAwesomeIcons.book, "Guia de doação",
                      pageController, 2),
                  DrawerTile(FontAwesomeIcons.calendarAlt, "Histórico",
                      pageController, 3),
                  DrawerTile(
                      FontAwesomeIcons.infoCircle, "Sobre", pageController, 4),
                  DrawerTile(FontAwesomeIcons.centercode, "ADM", pageController, 5),
                ],
              ))),
              ScopedModelDescendant<UserModel>(
                  builder: (context, child, model) {
                return InkWell(
                    onTap: () {
                      if (!model.isLoggedIn())
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      else
                        model.signOut();
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            !model.isLoggedIn() ?FontAwesomeIcons.signInAlt : FontAwesomeIcons.signOutAlt,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                              !model.isLoggedIn()
                                  ? "Entrar"
                                  : "Sair",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                        ],
                      ),
                    ));
              }),
            ],
          )
        ],
      ),
    );
  }
}
