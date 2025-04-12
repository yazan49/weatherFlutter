import 'package:flutter/material.dart';
import 'package:flutter_app/styles/AppStyle.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Lottie.asset(
          'lib/assets/animation/cloud.json',
          onLoaded: (composition) {
            Future.delayed(composition.duration, () {
              Navigator.popAndPushNamed(context, '/home');
            });
          },
        ),
      ),
    );
  }
}
