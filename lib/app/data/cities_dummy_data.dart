import '../models/city_weather_model.dart';

List<CityWeatherModel> citiesWeatherData = [
  CityWeatherModel(
    city: "Kochi",
    state: "Kerala",
    weather: "Rainy",
    temperature: 28,
    humidity: 82,
    airQuality: 42,
    weatherIcon: "🌧️",
    time: "10:30 AM",
    windSpeed: 14.2,
  ),

  CityWeatherModel(
    city: "Bangalore",
    state: "Karnataka",
    weather: "Cloudy",
    temperature: 24,
    humidity: 65,
    airQuality: 58,
    weatherIcon: "☁️",
    time: "10:30 AM",
    windSpeed: 10.5,
  ),

  CityWeatherModel(
    city: "Mumbai",
    state: "Maharashtra",
    weather: "Sunny",
    temperature: 32,
    humidity: 70,
    airQuality: 75,
    weatherIcon: "☀️",
    time: "10:30 AM",
    windSpeed: 18.1,
  ),

  CityWeatherModel(
    city: "Delhi",
    state: "Delhi",
    weather: "Haze",
    temperature: 36,
    humidity: 40,
    airQuality: 120,
    weatherIcon: "🌫️",
    time: "10:30 AM",
    windSpeed: 8.4,
  ),
];