import 'dart:convert';
import 'member.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'strings.dart';

class GHFlutterState extends State<GHFlutter> {
  // List of GitHub team members
  var _members = <Member>[];

  // Text style with large font
  final _biggerFont = const TextStyle(fontSize: 18);

  // Build each row of ListView
  _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_members[i].avatarURL),
        ),
        title: Text("${_members[i].login}", style: _biggerFont),
      ),
    );
  }

  // Asynchronous HTTP call
  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      final membersJSON = json.decode(response.body);

      for (var memberJSON in membersJSON) {
        final member = Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          if (position.isOdd) return Divider();

          final index = position ~/ 2;

          return _buildRow(index);
        },
        itemCount: 2 * _members.length,
        padding: EdgeInsets.all(16),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }
}

class GHFlutter extends StatefulWidget {
  @override
  createState() => GHFlutterState();
}