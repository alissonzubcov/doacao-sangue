import 'package:flutter/material.dart';
import 'package:semana_info_flutter/model/user_model.dart';
import 'package:semana_info_flutter/screens/login_screen.dart';

class HistoricoRegistroScreen extends StatefulWidget {
  @override
  _HistoricoRegistroScreenState createState() =>
      _HistoricoRegistroScreenState();
}

class _HistoricoRegistroScreenState extends State<HistoricoRegistroScreen> {
  final _formKey = GlobalKey<FormState>();

  final _dataControler = TextEditingController();
  final _obsControlher = TextEditingController();
  final _localControlher = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9C1C1D),
        title: Text("Cadastrar Doação"),
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
                        controller: _dataControler,
                        decoration: InputDecoration(
                          labelText: 'Data',
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
                        keyboardType: TextInputType.datetime,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        style: new TextStyle(color: Colors.white),
                        controller: _localControlher,
                        decoration: InputDecoration(
                          labelText: 'Local',
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
                      TextFormField(
                        style: new TextStyle(color: Colors.white),
                        controller: _obsControlher,
                        decoration: InputDecoration(
                          labelText: 'Observação',
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
                  if ((_dataControler.text != "" && _obsControlher.text != "" && _localControlher.text != "")) {
                    HistoricoRegistrar hr = HistoricoRegistrar();

                    hr.data = _dataControler.text;
                    hr.observacao = _obsControlher.text;
                    hr.local = _localControlher.text;

                    UserModel.of(context).addHistorico(hr);

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
