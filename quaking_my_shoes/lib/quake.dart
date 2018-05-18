import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'dart:async';

class Quake extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuakeState();
  }
}

class QuakeState extends State<Quake> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  var _data = <CellData>[];

  _loadData() async {
    String apiURL =
        'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
    http.Response response = await http.get(apiURL);
    setState(() {
      final data = json.decode(response.body);
      final list = data["features"];
      for (var details in list) {
        var props = details["properties"];
        //print(props);
        final cell = new CellData(props["time"], props["place"], props["mag"]);
        _data.add(cell);
      }
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Quakey",
          style: new TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.grey.shade400,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView.builder(
            itemCount: _data.length * 2,
            itemBuilder: (BuildContext context, int position) {
              if (position.isOdd) return new Divider(
                indent: 8.0,
                color: Colors.white,
              );
              final index = position ~/ 2;
              return _buildRow(index);
            }),
      ),
    );
  }
  Widget _buildRow(int i) {
    return new Padding(padding: new EdgeInsets.all(8.0),
      child: new ListTile(
        title: new Text("${_data[i].date}",
          style: new TextStyle(
            
          ),
        ),
        subtitle: new Text("${_data[i].subtitle}",
        style: new TextStyle(
          color: Colors.grey.shade100,
        ),
        ),
        leading: new CircleAvatar(
          backgroundColor: Colors.greenAccent.shade700,
          child: new Text("${_data[i].intensity}",
          style: new TextStyle(
            color: Colors.white,
          ),
          ),
        ),
        onTap: () {_showAlert(context, "${_data[i].subtitle}");},
      ),
    );
  }
}

Future<Null> _showAlert(BuildContext context, String message) async {
  return showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return new CupertinoAlertDialog(
        title: new Text("Quakes"),
        content: new Text(message),
        actions: <Widget>[
          new FlatButton(onPressed: () {
            Navigator.pop(context);
          },
              child: new Text("OK")
          ),
        ],
      );
    },
  );
}




