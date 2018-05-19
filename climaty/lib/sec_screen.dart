import 'package:flutter/material.dart';

class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => new _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  final _cityCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        title: new Text("Change City"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade400,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new Stack(
          children: <Widget>[
            new Image.asset('images/white_snow.png',
            width: 490.0,
            height: 1200.0,
              fit: BoxFit.fill,
            ),
            new Padding(padding: new EdgeInsets.all(16.0),
              child: new TextField(
                controller: _cityCont,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  labelText: "City Name",
                  labelStyle: new TextStyle(
                    color: Colors.blueGrey,
                  ),
                  hintText: "for Weather",
                ),
              ),
            ),
            new Align(
              alignment: Alignment.topCenter,
              child: new Padding(padding: new EdgeInsets.only(top: 100.0),
                child: new RaisedButton(onPressed: () {
                  Navigator.pop(context, {
                    'enter': _cityCont.text
                });
                  },
                  child: new Text("Get Weather", style:
                    new TextStyle(color: Colors.white),
                  ),
                  color: Colors.redAccent.shade200,
                ),
              ),
            ),
          ],
        ),
        ),
    );
  }
}

   