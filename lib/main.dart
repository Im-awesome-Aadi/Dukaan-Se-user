import 'package:flutter/material.dart';
import 'package:users/screens/auth/login.dart';

import 'package:users/screens/auth/signup.dart';
import 'package:users/screens/dashboard.dart';

import 'package:users/controller/waiting.dart';

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
