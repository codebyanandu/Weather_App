import 'package:flutter/material.dart';
import 'package:weather_app/app/utils/colors.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  /// 🧠 Get Day Name from Date
  String _getDayName(int index) {
    final now = DateTime.now();
    final date = now.add(Duration(days: index));

    return [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ][date.weekday - 1];
  }

  /// 🔥 Today / Tomorrow Logic
  String _getDayLabel(int index) {
    if (index == 0) return "Today";
    if (index == 1) return "Tomorrow";
    return _getDayName(index);
  }

  /// 🌤 Dummy weather data (replace later with API)
  final List<Map<String, dynamic>> forecastData = const [
    {"tempMax": 30, "tempMin": 24, "condition": "Sunny"},
    {"tempMax": 29, "tempMin": 23, "condition": "Cloudy"},
    {"tempMax": 28, "tempMin": 22, "condition": "Rain"},
    {"tempMax": 31, "tempMin": 25, "condition": "Sunny"},
    {"tempMax": 30, "tempMin": 24, "condition": "Cloudy"},
    {"tempMax": 27, "tempMin": 22, "condition": "Rain"},
    {"tempMax": 29, "tempMin": 23, "condition": "Sunny"},
  ];

  /// 🎨 Get icon based on condition
  IconData _getWeatherIcon(String condition) {
    switch (condition) {
      case "Sunny":
        return Icons.wb_sunny;
      case "Cloudy":
        return Icons.cloud;
      case "Rain":
        return Icons.grain;
      default:
        return Icons.wb_sunny;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        title: const Text(
          "7-Day Forecast",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AColors.primaryClr,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: forecastData.length,
        itemBuilder: (context, index) {
          final data = forecastData[index];
          final isToday = index == 0;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isToday
                    ? AColors.primaryClr.withOpacity(0.08)
                    : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: isToday
                    ? Border.all(color: AColors.primaryClr, width: 1)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),

              child: Row(
                children: [

                  /// 🌤 ICON
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AColors.primaryClr.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getWeatherIcon(data["condition"]),
                      color: AColors.primaryClr,
                    ),
                  ),

                  const SizedBox(width: 16),

                  /// 📅 DAY + CONDITION
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getDayLabel(index),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isToday
                                ? AColors.primaryClr
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data["condition"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// 🌡 TEMP RANGE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${data["tempMax"]}°",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${data["tempMin"]}°",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}