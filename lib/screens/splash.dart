import 'package:flutter/material.dart';
import 'package:weather_app/app/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AColors.primaryClr,body:Text('Splash Screen'));
  }
}
