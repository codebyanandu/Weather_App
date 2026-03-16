import 'package:flutter/material.dart';
import 'package:weather_app/app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  String currentCity = "Kochi";
  String currentTemp = "29°C";
  String weatherStatus = "Cloudy";

  List<Map<String,String>> savedCities = [
    {"city":"Delhi","temp":"34°C"},
    {"city":"Mumbai","temp":"30°C"},
    {"city":"Chennai","temp":"32°C"},
    {"city":"Bangalore","temp":"26°C"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AColors.primaryClr,
      ),

      body: Container(

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3A49F9),
              Color(0xff42A5F5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// 🔍 SEARCH BOX
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: _controller,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    hintText: "Search city...",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                  ),
                  onSubmitted: (value) {
                    if(value.isNotEmpty){
                      setState(() {
                        currentCity = value;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 25),

              /// 🌤 CURRENT WEATHER CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      currentCity,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Icon(
                      Icons.wb_sunny,
                      size: 60,
                      color: Colors.yellow,
                    ),
                    const SizedBox(height: 10),

                    Text(
                      currentTemp,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      weatherStatus,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              /// 🌡 WEATHER DETAILS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  weatherDetail("Humidity", "75%", Icons.water_drop),
                  weatherDetail("Wind", "8 km/h", Icons.air),
                  weatherDetail("Pressure", "1012 hPa", Icons.speed),
                ],
              ),
              const SizedBox(height: 20),

              /// 🌍 SAVED CITIES TITLE
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Saved Cities",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// 📍 CITY LIST
              Expanded(
                child: ListView.builder(
                  itemCount: savedCities.length,
                  itemBuilder: (context,index){
                    final city = savedCities[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.location_city,
                          color: Colors.blue,
                        ),
                        title: Text(
                          city["city"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          city["temp"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


            const SizedBox(height: 24),

           
          ],
        ),
      ),
    );
  }
}
