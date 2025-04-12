import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Details.dart';
import 'package:flutter_app/screens/Search.dart';
import 'package:flutter_app/screens/Welcome.dart';
import 'package:flutter_app/screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing',
      initialRoute: '/welcome',
      routes: {
        '/home': (context) => HomeScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/search': (context) => SearchScreen(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}
