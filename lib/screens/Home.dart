import 'package:flutter/material.dart';
import 'package:flutter_app/styles/AppStyle.dart';
import 'package:lottie/lottie.dart';

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Lottie.asset(
                'lib/assets/animation/rain.json',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppTheme.secondary,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: Text(
                  'Search For Cities',
                  style: TextStyle(color: AppTheme.secondary, fontSize: 16),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
