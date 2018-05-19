import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'util.dart' as util;
import 'package:http/http.dart' as http;
import 'sec_screen.dart';

class UI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UIState();
  }
}

class UIState extends State<UI> {
String _selectedCity = "HangZhou";

Future _goToNextScreen(BuildContext context) async {
  Map results = await Navigator.of(context).push(
    new MaterialPageRoute<Map>(builder: (BuildContext context){
      return new TextScreen();
    }));
  if (results != null && results.containsKey('enter')) {
    util.city = results['enter'];
    _selectedCity = results['enter'];
    //updateTempWidget(results['enter']);
  }
}

  void showStuff() async {
    Map data = await getWeather();
    print(data.toString());
  }
  @override
  Widget build(BuildContext content) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Klimatic",
          style: new TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.menu),
              onPressed: () {_goToNextScreen(context);}),
        ],
        backgroundColor: Colors.red.shade400,
      ),
      backgroundColor: Colors.grey.shade400,
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/umbrella.png',
              width: 490.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
            child: new Text("$_selectedCity",
            style: cityStyle(),
            ),
          ),
          
          new Container(
            alignment: Alignment.center,
            child: new Image.asset("images/light_rain.png"),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(30.0, 400.0, 0.0, 0.0),
            child: updateTempWidget(_selectedCity),
            ),
        ],
      ),
    );
  }

  Future<Map> getWeather([String city]) async {
    if (city != null) {
      _selectedCity = city;
    } else {
      _selectedCity = "Ann Arbor";
    }

    String apiURL = 'https://api.openweathermap.org/data/2.5/weather?'
        'q=$_selectedCity&appid=${util.apiId}&units=imperial';;
    http.Response response = await http.get(apiURL);
    return json.decode(response.body);
  }
  
  Widget updateTempWidget(String city) {
    return new FutureBuilder(
      future: getWeather(city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if (snapshot.hasData) {
          Map content = snapshot.data;
          num temp = content["main"]["temp"];
          return new Container(
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(temp.toStringAsFixed(0)+" F",
                  style: tempStyle(),
                  ),
                  subtitle: new ListTile(
                    title: new Text(
                      "Humidity: ${content['main']['humidity'].toString()} %\n"
                          "Min: ${content['main']['temp_min'].toString()} F\n"
                          "Max: ${content['main']['temp_max'].toString()} F",
                      style: new TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return new Container();
        }
    });
  }
}

TextStyle cityStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic,
  );
}

TextStyle tempStyle() {
  return new TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontSize: 50.0,
    fontWeight: FontWeight.w500,
  );
}