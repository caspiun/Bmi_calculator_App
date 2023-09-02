import 'package:flutter/material.dart';
import 'constants.dart';
class ReusableWidget extends StatelessWidget {

  ReusableWidget( {this.colour,this.cardchild,this.clr});
  Color ?colour;
  Widget ?cardchild;
  final VoidCallback ?clr;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clr,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,

          borderRadius: BorderRadius.circular(10.0),
          
        ),
      ),
    );
  }
}