import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:semana_info_flutter/data/data.dart';
import 'package:semana_info_flutter/model/user_model.dart';
import 'package:semana_info_flutter/screens/login_screen.dart';
import 'package:semana_info_flutter/screens/realizar_doacao_screen.dart';

class QuetionarioScreen extends StatefulWidget {
  @override
  _QuetionarioScreenState createState() => _QuetionarioScreenState();
}

class Pergunta {
  String questao;
  bool resposta;
  bool respostaEsperada;

  Pergunta(this.questao, this.resposta, this.respostaEsperada);

  static fromFirebase(DocumentSnapshot d) {
    return new Pergunta(d.data['pergunta'], null, d.data['respostaEsperada']);
  }
}

class _QuetionarioScreenState extends State<QuetionarioScreen> {
  List perguntas = [];

  @override
  Widget build(BuildContext context) {
    if (UserModel.of(context).isLoggedIn()) {
      return FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("questoes").getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (perguntas.length == 0) {
                perguntas = snapshot.data.documents
                    .map((e) => Pergunta.fromFirebase(e))
                    .toList();
              }
              return Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                          child: Center(
                    child: Column(
                      children: perguntas
                          .map((e) => questionCard(e.questao, e.resposta))
                          .toList(),
                    ),
                  ))),
                  ElevatedButton(
                      onPressed: !verificarRespostas()
                          //tela resposta negativa formulario
                          ? null
                          //tela resposta positiva formulario
                          : () {
                              if (verificaRespostasCertas()) {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => RealizarDoacaoScreen(),
                                ));
                                //segue para tela de agendamento
                              } else {
                                // segue para tela explicando o motivo de não poder dar sequencia
                              }
                            },
                      child: Text("Continua"))
                ],
              );
            }
          });
    }else{
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.login,
              size: 80.0,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Faça o login para continuar!",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
              child: Text(
                "Entrar",
                style: TextStyle(fontSize: 18.0),
              ),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            )
          ],
        ),
      );
    }
  }

  Widget questionCard(String questao, bool resposta) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: Color(0xffD61E23),
          borderRadius: new BorderRadius.circular(25.0)),
      height: 200,
      width: 400,
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Text(
                questao,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          GroupButton(
            isRadio: true,
            spacing: 10,
            onSelected: (index, isSelected) {
              if (index == 0) {
                resposta = true;
              } else {
                resposta = false;
              }
              setState(() {
                perguntas.forEach((e) {
                  if (e.questao == questao) {
                    e.resposta = resposta;
                  }
                  print(e.resposta);
                });
              });
            },
            buttons: [
              "SIM",
              "NÃO",
            ],
          ),
        ],
      ),
    );
  }

  bool verificarRespostas() {
    bool condicao = true;
    perguntas.forEach((e) {
      if (e.resposta == null) {
        condicao = false;
      }
    });
    print('condicao' + condicao.toString());

    return condicao;
  }

  bool verificaRespostasCertas() {
    bool condicao = true;
    List<String> respostas = [];

    perguntas.forEach((e) {
      if (e.resposta != e.respostaEsperada) {
        condicao = false;
        respostas.add(e.questao);
      }
    });
    return condicao;
  }
}
