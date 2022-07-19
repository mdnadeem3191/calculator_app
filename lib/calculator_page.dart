import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int? firstNum;

  int? secondNum;
  String history = "";

  String res = "";

  String texttodisplay = "";

  String? operator;

  void btnclkd(String btnval) {
    if (btnval == "C") {
      history = "";
      res = "";
      texttodisplay = "";
      firstNum = 0;
      secondNum = 0;
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstNum = int.parse(texttodisplay);
      res = "";
      operator = btnval;
      history = firstNum.toString() + operator.toString();
    } else if (btnval == "=") {
      secondNum = int.parse(texttodisplay);
      history = firstNum.toString() +
          operator.toString() +
          secondNum.toString() +
          ' =';
      if (operator == "+") {
        res = (firstNum! + secondNum!).toString();
      }
      if (operator == "-") {
        res = (firstNum! - secondNum!).toString();
      }
      if (operator == "x") {
        res = (firstNum! * secondNum!).toString();
      }
      if (operator == "/") {
        res = (firstNum! / secondNum!).toString();
      }
    } else {
      res = (int.parse(texttodisplay + btnval)).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(
    String btnval,
  ) {
    return Expanded(
      child: Container(
        child: OutlinedButton(
          onPressed: () {
            btnclkd(btnval);
          },
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              btnval,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Calculator",
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Calculator",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red[500],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Expanded(
                    child: Text(
                  history,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Expanded(
                    child: Text(
                  texttodisplay,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )),
              ),
              Row(
                children: [
                  custombutton("9"),
                  custombutton("8"),
                  custombutton("7"),
                  custombutton("+"),
                ],
              ),
              Row(
                children: [
                  custombutton("6"),
                  custombutton("5"),
                  custombutton("4"),
                  custombutton("-"),
                ],
              ),
              Row(
                children: [
                  custombutton("3"),
                  custombutton("2"),
                  custombutton("1"),
                  custombutton("x"),
                ],
              ),
              Row(
                children: [
                  custombutton("C"),
                  custombutton("0"),
                  custombutton("="),
                  custombutton("/"),
                ],
              )
            ],
          ),
        ));
  }
}
