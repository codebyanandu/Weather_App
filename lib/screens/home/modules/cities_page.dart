import 'package:flutter/material.dart';
import 'package:weather_app/app/data/cities_dummy_data.dart';
import 'package:weather_app/app/models/city_weather_model.dart';
import 'package:weather_app/app/utils/colors.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<CityWeatherModel> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = citiesWeatherData;
  }

  void _searchCity(String query) {
    setState(() {
      filteredCities = citiesWeatherData.where((city) {
        return city.city.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Color getAQIColor(int aqi) {
    if (aqi <= 50) {
      return Colors.green;
    } else if (aqi <= 100) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        title: const Text(
          "Cities",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AColors.primaryClr,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Column(
        children: [

          /// SEARCH
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _searchCity,
                decoration: const InputDecoration(
                  hintText: "Search city...",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ),

          /// CITY LIST
          Expanded(
            child: filteredCities.isEmpty
                ? const Center(
                    child: Text(
                      "No cities found",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredCities.length,
                    itemBuilder: (context, index) {

                      final city = filteredCities[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {

                            /// NEXT SCREEN LATER
                          },
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),

                            child: Column(
                              children: [

                                /// TOP ROW
                                Row(
                                  children: [

                                    Container(
                                      height: 55,
                                      width: 55,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AColors.primaryClr.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Text(
                                        city.weatherIcon,
                                        style: const TextStyle(fontSize: 26),
                                      ),
                                    ),

                                    const SizedBox(width: 14),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [

                                          Text(
                                            city.city,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          const SizedBox(height: 3),

                                          Text(
                                            city.state,
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [

                                        Text(
                                          "${city.temperature}°",
                                          style: const TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Text(
                                          city.weather,
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                const SizedBox(height: 18),

                                /// BOTTOM INFO
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [

                                    _buildInfoTile(
                                      Icons.water_drop,
                                      "${city.humidity}%",
                                      "Humidity",
                                    ),

                                    _buildInfoTile(
                                      Icons.air,
                                      "${city.windSpeed} km/h",
                                      "Wind",
                                    ),

                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: getAQIColor(city.airQuality)
                                            .withOpacity(0.12),
                                        borderRadius:
                                            BorderRadius.circular(14),
                                      ),
                                      child: Column(
                                        children: [

                                          Text(
                                            "${city.airQuality}",
                                            style: TextStyle(
                                              color: getAQIColor(city.airQuality),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          const SizedBox(height: 2),

                                          const Text(
                                            "AQI",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoTile(
      IconData icon,
      String value,
      String label,
      ) {
    return Row(
      children: [

        Icon(
          icon,
          size: 18,
          color: AColors.primaryClr,
        ),

        const SizedBox(width: 6),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        )
      ],
    );
  }
}