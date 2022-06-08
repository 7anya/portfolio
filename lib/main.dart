import 'package:flutter/material.dart';
import 'package:mySite/UI/Home.dart';
import 'package:mySite/staticData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.fullName,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
