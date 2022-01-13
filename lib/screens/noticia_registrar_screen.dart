import 'package:flutter/material.dart';
import 'package:semana_info_flutter/model/user_model.dart';
import 'package:semana_info_flutter/screens/login_screen.dart';

class NoticiaRegistroScreen extends StatefulWidget {
  @override
  _NoticiaRegistroScreenState createState() =>
      _NoticiaRegistroScreenState();
}

class _NoticiaRegistroScreenState extends State<NoticiaRegistroScreen> {
  final _formKey = GlobalKey<FormState>();

  final _tiluloControler = TextEditingController();
  final _imagemControlher = TextEditingController();
  final _textoControlher = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9C1C1D),
        title: Text("Notícia Registro"),
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
              onPressed: () {
                if (UserModel.of(context).isLoggedIn()) {

                  if ((_tiluloControler.text != ""  && _textoControlher.text != "")) {
                    NoticiaRegistrar nt = NoticiaRegistrar();

                    String imagemUrl = _imagemControlher.text;

                    nt.titulo = _tiluloControler.text;
                    nt.imagemUrl = imagemUrl.isNotEmpty ? imagemUrl : "https://triunfo.pe.gov.br/pm_tr430/wp-content/uploads/2018/03/sem-foto.jpg";
                    nt.texto = _textoControlher.text ;

                    print(nt.imagemUrl);
                    

                    UserModel.of(context).addNoticia(nt);

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
