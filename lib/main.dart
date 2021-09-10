import 'package:flutter/material.dart';
import 'package:Tanya/UI/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tanya Prasad',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
