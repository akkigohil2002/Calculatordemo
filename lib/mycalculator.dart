import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:mycalculatorapp/colors.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {

  // creating variables

  double firstNum=0.0;
  double secondNum=0.0;
  var input='';
  var output='';
  var operation='';
  var hideInput=false;
  var outputSize=34.0;


  onButtonClick(value ){
    if(value=="AC"){
       input='';
       output='';
    }
    else if(value=='<'){
      input=input.substring(0,input.length-1);
    }
    else if(value=="="){
      var userInput=input;
      userInput=input.replaceAll('x', '*');
      Parser p=Parser();
      Expression expression=p.parse(userInput);
      ContextModel cm=ContextModel();
      var finalValue=expression.evaluate(EvaluationType.REAL, cm);
      output=finalValue.toString();
      if(output.endsWith("0")){
        output=output.substring(0,output.length-2);
      }
      input=output;
    }
    else{
      input=input+value;
    }


    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('My Calculator App',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    output,
                    style: TextStyle(fontSize: outputSize, color: Colors.white.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              button(
                text: "AC",
                buttonBgColor: operatorColor,
                tColor: orangeColor,
              ),
              button(
                text: "<",
                buttonBgColor: operatorColor,
                tColor: orangeColor,
              ),
              button(
                text: "",
                buttonBgColor: Colors.transparent,
                tColor: orangeColor,
              ),
              button(
                text: "/",
                buttonBgColor: operatorColor,
                tColor: orangeColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "7",
              ),
              button(
                text: "8",
              ),
              button(
                text: "9",
              ),
              button(
                text: "x",
                tColor: orangeColor,
                buttonBgColor: operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "4",
              ),
              button(
                text: "5",
              ),
              button(
                text: "6",
              ),
              button(
                text: "-",
                tColor: orangeColor,
                buttonBgColor: operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "1",
              ),
              button(
                text: "2",
              ),
              button(
                text: "3",
              ),
              button(
                text: "+",
                tColor: orangeColor,
                buttonBgColor: operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                  text: "%", tColor: orangeColor, buttonBgColor: operatorColor),
              button(
                text: "0",
              ),
              button(
                text: ".",
              ),
              button(
                text: "=",
                buttonBgColor: orangeColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    required String text,
    Color tColor = Colors.white,
    Color buttonBgColor = buttonColor,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(22),
            backgroundColor: buttonBgColor,
          ),
          onPressed: ()=>onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
