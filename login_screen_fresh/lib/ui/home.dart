import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";

  _clearText() {
    _userController.clear();
    _passwordController.clear();
  }

  _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty && _passwordController.text.isNotEmpty) _welcomeString = _userController.text;
      else _welcomeString = "nothing";
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Login',
          style: TextStyle(
            color: Colors.purple.shade100, fontSize: 35.0, fontFamily: 'Brush Script MT')
          ),
          backgroundColor: Colors.purpleAccent,
          centerTitle: true,
        ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        padding: new EdgeInsets.only(top: 16.0),
        child: new Column(
          children: <Widget>[
            new Image.asset(
                "images/face.png",
              width: 120.0,
              height: 120.0,
              color: Colors.blueAccent,
            ),
            new Padding(padding: new EdgeInsets.only(bottom: 16.0)),
            new Container(
              padding: new EdgeInsets.all(4.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
                border: new Border.all(color: Colors.grey.shade700, width: 2.0),
                color: Colors.grey.shade300,
              ),
              height: 180.0,
              width: 380.0,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: "Username",
                      icon: new Icon(Icons.person),

                    ),
                  ),

                  new TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: new InputDecoration(
                        hintText: "Password",
                        icon: new Icon(Icons.lock)
                    ),
                  ),
                  new Expanded(child:
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new RaisedButton(
                          onPressed: _showWelcome,
                        color: Colors.redAccent,
                        textColor: Colors.white70,
                        padding: new EdgeInsets.all(4.0),
                        child: new Text("Login",
                          style: new TextStyle(
                          fontSize: 17.0,
                        ),
                        ),
                      ),
                      new Padding(padding: new EdgeInsets.all(56.0)),
                      new RaisedButton(
                          onPressed: _clearText,
                        color: Colors.redAccent,
                        textColor: Colors.white70,
                        padding: new EdgeInsets.all(4.0),
                        child: new Text("Clear",
                        style: new TextStyle(
                          fontSize: 17.0,
                        ),
                        ),
                      )
                    ],
                  ),
                  ),
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(16.0)),
            new Text("Welcome, $_welcomeString",
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
            ),
          ],
        ),
      ),
      );
}
}
