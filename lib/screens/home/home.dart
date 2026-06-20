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
       extendBody: true,
      body: screens[_index],

      bottomNavigationBar: Container(
         margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_rounded, "Home", 0),
            _buildNavItem(Icons.location_city_rounded, "Cities", 1),
            _buildNavItem(Icons.calendar_month_rounded, "Forecast", 2),
          ],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _index,
      //   selectedItemColor: const Color(0xFF3A49F9),
      //   onTap: (i) {
      //     setState(() => _index = i);
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.location_city), label: "Cities"),
      //     BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Forecast"),
      //   ],
      // ),
    );
  }

 Widget _buildNavItem(IconData icon, String label, int index) {
  bool selected = _index == index;

  return GestureDetector(
    onTap: () {
      setState(() {
        _index = index;
      });
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: selected
            ? Colors.white.withOpacity(0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: selected ? 28 : 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight:
                  selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}
}
