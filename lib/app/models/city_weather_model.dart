class CityWeatherModel {
  final String city;
  final String state;
  final String weather;
  final int temperature;
  final int humidity;
  final int airQuality;
  final String weatherIcon;
  final String time;
  final double windSpeed;

  CityWeatherModel({
    required this.city,
    required this.state,
    required this.weather,
    required this.temperature,
    required this.humidity,
    required this.airQuality,
    required this.weatherIcon,
    required this.time,
    required this.windSpeed,
  });
}