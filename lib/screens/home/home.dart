import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/modules/forecast.dart';
import 'package:weather_app/screens/home/modules/home_page.dart';
import 'package:weather_app/screens/home/modules/cities_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final screens = const [
    HomeScreen(),
    CitiesScreen(),
    ForecastScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: const Color(0xFF3A49F9),
        onTap: (i) {
          setState(() => _index = i);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: "Cities"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Forecast"),
        ],
      ),
    );
  }
}