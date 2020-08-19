import 'package:flutter/material.dart';
import 'package:users/signup.dart';
import 'package:users/login.dart';
import 'package:users/waiting.dart';
import 'package:users/Dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => SignupPage(),
        '/Dash': (BuildContext context) => DashBoard(),
        '/login': (BuildContext context) => LoginPage()
      },
      home: WaitingScreen(),
      theme: ThemeData(fontFamily: "Montserrat"),
    );
  }
}
