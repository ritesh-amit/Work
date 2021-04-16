import 'package:flutter/material.dart';
import 'package:spare/login.dart';
import 'package:spare/login2.dart';
import 'package:spare/signUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vendor',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LoginPage2(),
    );
  }
}
