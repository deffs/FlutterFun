import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Weighty extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WeightyState();
  }
}

class WeightyState extends State<Weighty> {
  int radioVal = 0;
  final TextEditingController _weightCont = new TextEditingController();

  String _formattedText = "Please enter your weight!";

  handleChange(int val) {
    double _finalResult = 0.0;
    setState(() {
      radioVal = val;
      switch(radioVal) {
        case 0:
          _finalResult = calWeight(0.06);
          if (_finalResult > 0.0) {
            _formattedText =
            "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          }
          break;
        case 1:
          _finalResult = calWeight(0.38);
          if (_finalResult > 0.0) {
            _formattedText =
            "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          }
          break;
        case 2:
          _finalResult = calWeight(0.91);
          if (_finalResult > 0.0) {
            _formattedText = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          }
      }
    });
  }

  double calWeight(double mult) {
    if (_weightCont.text.isNotEmpty) {
      if (int.tryParse(_weightCont.text) > 0) {
        return int.tryParse(_weightCont.text) * mult;
      }
    } else {
      _formattedText = "Please enter your weight!";
      return 0.0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Weight On Planets",
            style: new TextStyle(fontSize: 25.0, color: Colors.white70),
          ),
          backgroundColor: Colors.blueGrey.shade800,
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey,
        body: new Container (
      alignment: Alignment.topCenter,
        padding: new EdgeInsets.all(8.0),
        child: new InkWell(
    child: new ListView(
          children: <Widget>[
            new Image.asset(
              "images/planet.png",
              height: 133.0,
              width: 200.0,
            ),
            new TextField(
              controller: _weightCont,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                icon: Icon(Icons.person_outline),
                    labelText: "Your weight on Earth",
                hintText: "In Pounds",
              ),
            ),
            new Padding(padding: new EdgeInsets.all(8.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio<int>(
                  activeColor: Colors.blue.shade200,
                    value: 0, groupValue: radioVal, onChanged: handleChange),
                new Text("Pluto"),
                new Radio<int>(
                  activeColor: Colors.redAccent.shade700,
                    value: 1, groupValue: radioVal, onChanged: handleChange),
                new Text("Mars"),
                new Radio<int>(
                  activeColor: Colors.orangeAccent.shade400,
                    value: 2, groupValue: radioVal, onChanged: handleChange),
                new Text("Venus"),
              ],
            ),
            new Padding(padding: new EdgeInsets.all(8.0)),
            new Text(
              _weightCont.text.isEmpty ? "Please enter your weight!" : _formattedText,
            style: new TextStyle(
              color: Colors.white70,
                  fontSize: 20.4,
              fontWeight: FontWeight.w600,
            ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        ),
        ),
    );
  }
}
