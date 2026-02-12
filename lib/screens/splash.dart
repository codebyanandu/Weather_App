import 'package:flutter/material.dart';
import 'package:weather_app/app/utils/colors.dart';
import 'package:weather_app/app/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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