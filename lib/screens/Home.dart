import 'package:flutter/material.dart';
import 'package:flutter_app/styles/AppStyle.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to Weather App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppTheme.secondary,
      ),
      backgroundColor: AppTheme.background,
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Search For Cities',
            style: TextStyle(color: AppTheme.secondary),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
      ),
    );
  }
}
