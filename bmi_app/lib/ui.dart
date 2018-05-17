import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BMIState();
  }
}

class BMIState extends State<BMI> {
  var _ageCont = new TextEditingController();
  var _heightCont = new TextEditingController();
  var _weightCont = new TextEditingController();
  String _myString = "";
  String _resultStr = "";
  var BMI = 0.0;
  calcBMI() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      if (_heightCont.text.isNotEmpty && _weightCont.text.isNotEmpty) {
        BMI = (double.parse(_weightCont.text) /
            ((double.parse(_heightCont.text) * 12) *
                (double.parse(_heightCont.text) * 12))) * 703;
        _myString = "Your BMI: ${BMI.toStringAsFixed(1)}";
        if (BMI < 18.5) {
          _resultStr = "Underweight";
        }
        else if (BMI >= 18.5 && BMI < 25.0) {
          _resultStr = "Normal";
        }
        else if (BMI >= 25.0 && BMI < 30.0) {
          _resultStr = "Overweight";
        } else {
          _resultStr = "Obese";
        }
      } else {
        _myString = "Please Enter Your Details!";
        _resultStr = "";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text("BMI",
        style: new TextStyle(
          fontSize: 25.0,
          color: Colors.grey.shade100,
        ),
        ),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: new EdgeInsets.all(8.0),
          children: <Widget>[
            new Image.asset("images/bmilogo.png",
              height: 100.0,
              width: 200.0,
            ),
            new Container(
              padding: new EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                color: Colors.white70,
              ),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageCont,
                    decoration: new InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: "Age",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  new TextField(
                    controller: _heightCont,
                    decoration: new InputDecoration(
                      icon: Icon(Icons.insert_chart),
                      labelText: "Height in feet.inches",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  new TextField(
                    controller: _weightCont,
                  decoration: new InputDecoration(
                    icon: Icon(Icons.line_weight),
                    labelText: "Weight in lbs",
                  ),
                    keyboardType: TextInputType.number,
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 16.0)),
                  new CupertinoButton(
                      child: new Text(
                        "Calculate",
                        style: new TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.0,
                        ),
                      ), 
                      onPressed: calcBMI,
                    color: Colors.purpleAccent,
                    borderRadius: new BorderRadius.all(new Radius.circular(3.0)),
                    padding: new EdgeInsets.all(12.0),
                  ),
                ],
              ),
            ),
            new Container(
              alignment: Alignment.center,
              padding: new EdgeInsets.all(16.0),
              child: new Column(
                children: <Widget>[
                  new Text("$_myString",
                    style: new TextStyle(
                        fontSize: 17.0,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(6.0)),
                  new Text("$_resultStr",
                    style: new TextStyle(
                        fontSize: 17.0,
                        color: Colors.purpleAccent.shade700,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
