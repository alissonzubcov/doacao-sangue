import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Text(text, style: TextStyle(fontSize: 25, color: Colors.white)),
          ],
        ),
      ),
      ),
    );
  }
}
