// https://www.raywenderlich.com/4529993-getting-started-with-flutter

import 'ghflutter.dart';
import 'package:flutter/material.dart';

void main() => runApp(GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green.shade800),
      title: 'GHFlutter',
      home: GHFlutter(),
    );
  }
}