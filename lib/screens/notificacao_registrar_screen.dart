import 'package:flutter/material.dart';
import 'package:semana_info_flutter/model/user_model.dart';
import 'package:semana_info_flutter/screens/login_screen.dart';
import 'package:semana_info_flutter/shared/model/notification_model.dart';
import 'package:semana_info_flutter/shared/service/notificacao-service.dart';

class NotificacaoRegistroScreen extends StatefulWidget {
  @override
  _NotificacaoRegistroScreenState createState() =>
      _NotificacaoRegistroScreenState();
}

class _NotificacaoRegistroScreenState extends State<NotificacaoRegistroScreen> {
  final _formKey = GlobalKey<FormState>();

  final _tiluloControler = TextEditingController();
  // final _imagemControlher = TextEditingController();
  final _textoControlher = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9C1C1D),
        title: Text("Notificação Registro"),
        centerTitle: true,
        actions: <Widget>[],
      ),
      backgroundColor: Color(0xFF9C1C1D),
      body: Column(
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: new TextStyle(color: Colors.white),
                        controller: _tiluloControler,
                        decoration: InputDecoration(
                          labelText: 'Título',
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // TextFormField(
                      //   style: new TextStyle(color: Colors.white),
                      //   controller: _imagemControlher,
                      //   decoration: InputDecoration(
                      //     labelText: 'Imagem',
                      //     labelStyle: TextStyle(
                      //         color: Colors.white, fontWeight: FontWeight.bold),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.white)),
                      //     disabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.white),
                      //         borderRadius: BorderRadius.circular(30)),
                      //     enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.white),
                      //         borderRadius: BorderRadius.circular(30)),
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(30),
                      //         borderSide: BorderSide(color: Colors.white)),
                      //   ),
                      //   keyboardType: TextInputType.text,
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      
                      TextFormField(
                        style: new TextStyle(color: Colors.white),
                        controller: _textoControlher,
                        decoration: InputDecoration(
                          labelText: 'Texto',
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  )),
            ),
          )),
          ElevatedButton(
              onPressed: () async {
                if (UserModel.of(context).isLoggedIn()) {

                  if ((_tiluloControler.text != ""  && _textoControlher.text != "")) {
                    NotificationMessage nm = NotificationMessage();


                    nm.title = _tiluloControler.text;
                    // nt.imagemUrl = imagemUrl.isNotEmpty ? imagemUrl : "https://triunfo.pe.gov.br/pm_tr430/wp-content/uploads/2018/03/sem-foto.jpg";
                    nm.body = _textoControlher.text ;

                    await NotificacaoService.registrarNotificacaoAll(nm);

                    Navigator.of(context).pop();
                  }
                } else {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }
              },
              child: Text("Salvar"))
        ],
      ),
    );
  }
}
