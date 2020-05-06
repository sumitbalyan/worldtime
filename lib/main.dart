import 'package:flutter/material.dart';
import 'package:worldclock/pages/chooselocation.dart';
import 'package:worldclock/pages/home.dart';
import 'package:worldclock/pages/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    );
  }
}
