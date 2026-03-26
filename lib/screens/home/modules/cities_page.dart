import 'package:flutter/material.dart';
import 'package:weather_app/app/utils/colors.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {

  final TextEditingController _searchController = TextEditingController();

  List<String> cities = [
    "Kochi",
    "Delhi",
    "Mumbai",
    "Chennai",
    "Bangalore"
  ];

  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = cities;
  }

  void _searchCity(String query) {
    setState(() {
      filteredCities = cities
          .where((city) =>
              city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
        backgroundColor: AColors.primaryClr,
      ),

      body: Column(
        children: [

          /// 🔍 SEARCH
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: _searchCity,
              decoration: InputDecoration(
                hintText: "Search city...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          /// 📍 LIST
          Expanded(
            child: ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text(filteredCities[index]),
                  onTap: () {
                    // TODO: send selected city to Home
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}