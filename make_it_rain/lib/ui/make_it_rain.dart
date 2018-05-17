import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;
  void _rainMoney() {
    setState(() {
      _moneyCounter = _moneyCounter + 1000;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Make It Rain!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(
                "Get Rich!",
                style: new TextStyle(color: Colors.grey, fontSize: 30.1),
              ),
            ),

            new Expanded(
                child: new Center(
                  child: new Text('\$$_moneyCounter',
                  style: new TextStyle(
                    color: _moneyCounter >= 10000 ? Colors.greenAccent.shade700 : Colors.greenAccent.shade200,
                    fontSize: 45.5,
                    fontWeight: FontWeight.w800,
                  ),),
                )),
            new Expanded(
                child: new Center(
                  child: new CupertinoButton(
                      color: Colors.lightGreen,
                      pressedOpacity: 0.7,
                      padding: new EdgeInsets.all(12.0),
                      onPressed: _rainMoney,
                      child: new Text("Let It Rain!",
                      style: new TextStyle(
                        fontSize: 19.5,
                      ),)),
                ))
          ],
        ),
      ),
    );
  }
}
