 import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:semana_info_flutter/model/user_model.dart';
import 'package:semana_info_flutter/screens/home_screen.dart';
import 'package:semana_info_flutter/screens/noticias_screen.dart';
import 'package:semana_info_flutter/screens/login_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            return MaterialApp(
                  title: "Flutter's Clothing",
                  theme: ThemeData(
                      primarySwatch: Colors.blue,
                      primaryColor: Color.fromARGB(255, 4, 125, 141)
                  ),
                  debugShowCheckedModeBanner: false,
                  home: HomeScreen()
              );
          }
      ),
    );
  }
}
