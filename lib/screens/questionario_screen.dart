import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:semana_info_flutter/screens/realizar_doacao_screen.dart';

import 'nao_pode_realizar_doacao_screen.dart';

class QuetionarioScreen extends StatefulWidget {
  @override
  _QuetionarioScreenState createState() => _QuetionarioScreenState();
}

class Pergunta {
  String questao;
  bool resposta;
  bool respostaEsperada;

  Pergunta(this.questao, this.resposta, this.respostaEsperada);
}

class _QuetionarioScreenState extends State<QuetionarioScreen> {
  List<Pergunta> perguntas = [
    new Pergunta("Fumou nos ultimos 12 meses?", null, false),
    new Pergunta("Fumou nos ultimos 6 meses?", null, false),
    new Pergunta("Fumou nos ultimos 4 meses?", null, false),
    new Pergunta("Fumou nos ultimos 2 meses?", null, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF9C1C1D),
          title: Text("Questionário"),
          centerTitle: true,
          actions: <Widget>[],
        ),
        backgroundColor: Color(0xFF9C1C1D),
        body: Column(
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
                    ? null
                    : () {
                        if (verificaRespostasCertas()) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => RealizarDoacaoScreen(),
                          ));
                          //segue para tela de agendamento
                        } else {
                          // segue para tela explicando o motivo de não poder dar sequencia
                           Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => NaoPodeRealizarDoacaoScreen(),
                          ));
                        }
                      },
                child: Text("Continua"))
          ],
        ));
  }

  Widget questionCard(String questao, bool resposta) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: Color(0xffD61E23), borderRadius: new BorderRadius.circular(25.0)),
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

    return condicao;
  }

  bool verificaRespostasCertas() {
    bool condicao = true;
    List<String> respostas = [];
    Map retorno = {'respostasOK': false, 'respostas': []};

    perguntas.forEach((e) {
      if (e.resposta != e.respostaEsperada) {
        condicao = false;
        respostas.add(e.questao);
      }
    });
    retorno = {'respostasOK': condicao, 'respostas': respostas};
    return condicao;
  }
}
