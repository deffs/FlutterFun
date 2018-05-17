import 'package:flutter/material.dart';
import 'strings.dart';
import 'ghflutter.dart';

void main() => runApp(new GitHubFlutterApp());

class GitHubFlutterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.appTitle,
      theme: new ThemeData(primaryColor: Colors.deepPurple),
      home: new GitHubFlutter(),
    );
  }
}



