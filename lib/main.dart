import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/app/utils/colors.dart';
import 'package:weather_app/screens/splash.dart';

void main() {
    runZonedGuarded(() async {
      await _initializeApp();
      runApp(const MyApp());
    },
    (error, stack) {
      debugPrint(' Fatal Error: $error');
      debugPrint(' Stack trace: $stack');
    },
  );
}

/// Initialize all necessary services and configurations before running the app
Future<void> _initializeApp() async {
  try {
    await _initializeFlutterBindings();
    await _initializeServices();
    await _setDeviceConfigurations();
  } catch (e, stack) {
    debugPrint(' Initialization Error: $e');
    debugPrint(' Stack trace: $stack');
    rethrow;
  }
}

/// Initialize Flutter bindings
Future<void> _initializeFlutterBindings() async {
  debugPrint('🔧 Initializing Flutter Bindings...');
  WidgetsFlutterBinding.ensureInitialized();
}

/// Initialize all services required by the app
Future<void> _initializeServices() async {
  debugPrint('🔧 Initializing Services...');
}

/// Set device-specific configurations
Future<void> _setDeviceConfigurations() async {
  debugPrint('🔧 Setting Device Configurations...');

  // Force portrait mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Configure status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AColors.primaryClr,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: SplashScreen(),
    );
  }
}
