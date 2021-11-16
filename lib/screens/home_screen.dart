import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:semana_info_flutter/model/user_model.dart';
import 'package:semana_info_flutter/screens/area_adm_screen.dart';
import 'package:semana_info_flutter/screens/guia_doacao_.dart';
import 'package:semana_info_flutter/screens/historico_registrar_screen.dart';
import 'package:semana_info_flutter/screens/historico_screen.dart';
import 'package:semana_info_flutter/screens/noticias_screen.dart';
import 'package:semana_info_flutter/screens/questionario_screen.dart';
import 'package:semana_info_flutter/screens/sobre_screen.dart';
import 'package:semana_info_flutter/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          backgroundColor: Color(0xFF9C1C1D),
          appBar: AppBar(
            backgroundColor: Color(0xFF9C1C1D),
            title: Text("Home"),
            centerTitle: true,
          ),
          body: NoticiasScreen(),
          drawer: CustomDrawer(_pageController),
          // floatingActionButton: CartButton(),
        ),
        Scaffold(
          backgroundColor: Color(0xFF9C1C1D),
          appBar: AppBar(
            backgroundColor: Color(0xFF9C1C1D),
            title: Text("Realiar Doação"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: QuetionarioScreen(),
          // floatingActionButton: CartButton(),
        ),
        Scaffold(
          backgroundColor: Color(0xFF9C1C1D),
          appBar: AppBar(
            backgroundColor: Color(0xFF9C1C1D),
            title: Text("Guia de Doação"),
            centerTitle: true,
          ),
          body: GuiaDoacao(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
            backgroundColor: Color(0xFF9C1C1D),
            appBar: AppBar(
              backgroundColor: Color(0xFF9C1C1D),
              title: Text("Histórico"),
              centerTitle: true,
            ),
            body: HistoricoScreen(),
            drawer: CustomDrawer(_pageController),
            floatingActionButton: FloatingActionButton(
              onPressed: UserModel.of(context).isLoggedIn()
                  ? () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HistoricoRegistroScreen()))
                      }
                  : null,
              backgroundColor: Colors.red,
              child: Icon(FontAwesomeIcons.plus),
            )),
        Scaffold(
          backgroundColor: Color(0xFF9C1C1D),
          appBar: AppBar(
            backgroundColor: Color(0xFF9C1C1D),
            title: Text("Sobre"),
            centerTitle: true,
          ),
          body: SobreScreen(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          backgroundColor: Color(0xFF9C1C1D),
          appBar: AppBar(
            backgroundColor: Color(0xFF9C1C1D),
            title: Text("Área Administratica"),
            centerTitle: true,
          ),
          body: AreaAdmScreen(),
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}
