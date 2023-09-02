import 'package:flutter/material.dart';
class Exwidget extends StatelessWidget {
  Exwidget({
    this.pic,this.txt,
  });
  IconData ?pic;
  String ?txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          pic,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text('$txt',style: TextStyle(
            fontSize: 18.0,
            color:Colors.blueGrey
        ),)
      ],
    );
  }
}