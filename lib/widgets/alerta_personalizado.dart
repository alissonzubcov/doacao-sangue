import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showMyDialog(context) async {
  Color bgColor = Colors.black;
  Color fontColor = Colors.white;
  Navigator.of(context).pop();
  return showDialog<void>(
    context: context,
    //barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bgColor,
        title: Text(
          'Curso Flutter Fema',
          style: TextStyle(color: fontColor, fontSize: 25), textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text("Alisson Zubcov", textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, color: Colors.white)),
              ),

              RaisedButton(
                child: Text("GitHub",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
                onPressed: (){
                  launch("https://github.com/alissonrichardy");
                },
              ),
              RaisedButton(
                color: Colors.pink,
                child: Text("Youtube",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: (){
                  launch("https://www.youtube.com/channel/UC0aIl4sZxak-d86DT0bRiIA/videos");
                },
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text("Linkdin",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: (){
                  launch("https://br.linkedin.com/in/alisson-zubcov-01571b16a");
                },
              )
            ],
          ),
        ),
       
      );
    },
  );
}
