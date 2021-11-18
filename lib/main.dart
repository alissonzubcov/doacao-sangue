import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:semana_info_flutter/model/user_model.dart';
import 'package:semana_info_flutter/screens/home_screen.dart';

void main() => runApp(new MyApp());


void configurar() {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
      showToast(
        message['notification']['body'],
        animation: StyledToastAnimation.scale,
        duration: Duration(seconds: 10),
      );
    },
    onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    },
  );
  // TODO IOS
  _firebaseMessaging.requestNotificationPermissions();
}

class MyApp extends StatelessWidget {
  static FirebaseInAppMessaging fiam = FirebaseInAppMessaging();

  @override
  Widget build(BuildContext context) {
    configurar();
    FirebaseMessaging _messaging = new FirebaseMessaging();
    _messaging.subscribeToTopic("all");

    //teste notificacao
    //NotificacaoService.registrarNotificacaoAll();

    return StyledToast(
      locale: const Locale('en', 'US'),
      textStyle: TextStyle(fontSize: 16.0, color: Colors.white),
      backgroundColor: Color(0x99000000),
      borderRadius: BorderRadius.circular(5.0),
      textPadding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
      toastPositions: StyledToastPosition.bottom,
      toastAnimation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.fastLinearToSlowEaseIn,
      duration: Duration(seconds: 4),
      animDuration: Duration(seconds: 1),
      dismissOtherOnShow: true,
      child: ScopedModel<UserModel>(
        model: UserModel(),
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            return ScopedModel<UserModel>(
              model: UserModel(),
              child: ScopedModelDescendant<UserModel>(
                  builder: (context, child, model) {
                return MaterialApp(
                    title: "Ho",
                    theme: ThemeData(
                        primarySwatch: Colors.blue,
                        primaryColor: Color.fromARGB(255, 4, 125, 141)),
                    debugShowCheckedModeBanner: false,
                    home: HomeScreen());
              }),
            );
          },
        ),
      ),
    );
  }
}
