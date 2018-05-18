import 'package:flutter/material.dart';
import 'quake.dart';
import 'package:intl/intl.dart';

void main() async {
  runApp(new MaterialApp(
    title: "Quakey",
    home: new Quake(),
  ));
}

class CellData {
  var date;
  final String subtitle;
  final num intensity;

  CellData(this.date, this.subtitle, this.intensity) {
    var myDate = this.date;
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(myDate);
    var format = new DateFormat.yMMMMd().add_jm();
    var dateString = format.format(date);
    this.date = dateString;
  }


}