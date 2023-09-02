import 'package:flutter/material.dart';
import 'package:level1/inputpage.dart';
import 'package:level1/reusable_card.dart';
import 'constants.dart';
class Result extends StatelessWidget {
  final String ?interpret;
  final String ?bmiresult;
  final String ?resulttext;
  const Result({this.interpret,this.bmiresult,this.resulttext});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(/
        title: Text('BMI CALCULATOR'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.centerLeft,
            child: Text(textAlign:TextAlign.center,
              'Your results',style: ktitle,
            ),
          )),
          Expanded(flex: 5,
              child: ReusableWidget(
                colour: kacolor,
            cardchild:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resulttext!.toUpperCase(),style: kresulttext,),
                Text(bmiresult!,style: kbmi,),

                Text(interpret!,style: kbody,)
                ,
                Bottom(ontap: (){
                  Navigator.pop(context);
                },txt: 'Recalculate',)
              ],

            ) ,
          ))
        ],
      ),
    );
  }
}


