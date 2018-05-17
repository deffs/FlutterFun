import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'member.dart';
import 'strings.dart';

class GitHubFlutterState extends State<GitHubFlutter> {
  @override
  void initState() {
    super.initState();

    _loadData();
  }
  var _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 22.0);
  _loadData() async {
    String dataURL = "https://api.github.com/orgs/google/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      final membersJSON = json.decode(response.body);
      for (var memberJSON in membersJSON) {
        final member = new Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text(Strings.appTitle),
      ),
      body: new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _members.length * 2,
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) return new Divider();
            final index = position ~/ 2;
            return _buildRow(index);
          }),
    );
  }

  Widget _buildRow(int i) {
    return new Padding(
        padding: const EdgeInsets.only(left: 0.0, top: 8.0, right: 0.0, bottom: 8.0),
        child: new ListTile(
          title: new Text("${_members[i].login}", style: _biggerFont),
          leading: new CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage: new NetworkImage(_members[i].avatarURL),
          ),
        )
    );
  }
}

class GitHubFlutter extends StatefulWidget {
  @override
  createState() => new GitHubFlutterState();
}