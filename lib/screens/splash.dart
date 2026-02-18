import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/app/utils/colors.dart';
import 'package:weather_app/app/utils/constants.dart';
import 'package:weather_app/screens/onboarding/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer to navigate to LoginPage after 5 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return OnboardingScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AColors.primaryClr,
      body: Center(
        child: Text(
          kAppName,
          style: TextStyle(
            color: AColors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace'
          ),
        ),
      ),
    );
  }
}
