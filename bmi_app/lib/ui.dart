import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BMIState();
  }
}

class BMIState extends State<BMI> {
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
        backgroundColor: Colors.pinkAccent,
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
                    controller: null,
                    decoration: new InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: "Age",
                    ),
                  ),
                  new TextField(
                    controller: null,
                    decoration: new InputDecoration(
                      icon: Icon(Icons.insert_chart),
                      labelText: "Height in feet.inches",
                    ),
                  ),
                  new TextField(
                    controller: null,
                  decoration: new InputDecoration(
                    icon: Icon(Icons.line_weight),
                    labelText: "Weight in lbs",
                  ),
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
                      onPressed: () => debugPrint("calc"),
                    color: Colors.pinkAccent,
                    borderRadius: new BorderRadius.all(new Radius.circular(3.0)),
                    padding: new EdgeInsets.all(16.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
