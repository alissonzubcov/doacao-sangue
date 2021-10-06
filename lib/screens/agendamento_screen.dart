import 'package:flutter/material.dart';

class AgendamentoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agendar Doação"),
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioButtonPesonalizdo(),
                DropDownSelectPer(),
                Center(
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Confirmar")),
                )

/*
             new TextFormField(
                        style: new TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                        decoration: new InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                              color: Color(0xFF707070),
                              fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.red)),
                        ))
*/
              ]),
        ));
  }
}

enum OpcaoDoacao { sangue, plaqueta }

class RadioButtonPesonalizdo extends StatefulWidget {
  @override
  _RadioButtonPesonalizdoState createState() => _RadioButtonPesonalizdoState();
}

class _RadioButtonPesonalizdoState extends State<RadioButtonPesonalizdo> {
  OpcaoDoacao _group = OpcaoDoacao.plaqueta;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: Text("Plaqueta"),
            leading: Radio<OpcaoDoacao>(
              value: OpcaoDoacao.plaqueta,
              groupValue: _group,
              onChanged: (value) {
                setState(() {
                  _group = value;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text("Sangue"),
            leading: Radio<OpcaoDoacao>(
              value: OpcaoDoacao.sangue,
              groupValue: _group,
              onChanged: (value) {
                setState(() {
                  _group = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownSelectPer extends StatefulWidget {
  @override
  _DropDownSelectPerState createState() => _DropDownSelectPerState();
}

class _DropDownSelectPerState extends State<DropDownSelectPer> {
  String dropdownValue = 'Posto 1';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, top: 10),
        width: 250,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Posto",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 100),
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Posto 1', 'Posto 2', 'Posto 3', 'Posto 4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ));
  }
}
