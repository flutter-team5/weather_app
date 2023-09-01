import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/spacing.dart';
import 'package:weather_app/screens/weather_city_screen.dart';
import 'package:weather_app/service/database_service.dart';
import 'package:weather_app/widgets/weather_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WSpaces.kVspace8,
              const Text(
                "Weather",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              WSpaces.kVspace4,
              const SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a city',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              WSpaces.kVspace16,
              //adding animation
              FutureBuilder(
                future: getCities(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final citiesWeather = snapshot.data ?? [];
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return OpenContainer(
                            closedElevation: 0,
                            transitionType: ContainerTransitionType.fade,
                            transitionDuration: const Duration(seconds: 1),
                            openBuilder: (context, _) => WeatherCityScrren(
                              weather: citiesWeather[index],
                            ),
                            closedBuilder:
                                (context, VoidCallback openContainer) =>
                                    WeatherCard(
                              weather: citiesWeather[index],
                            ),
                          );
                        },
                        itemCount: citiesWeather.length,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// FutureBuilder(
//                 future: getCities(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final citiesWeather = snapshot.data ?? [];
//                     return Expanded(
//                       child: ListView.builder(
//                         itemBuilder: (context, index) {
//                           return WeatherCard(weather: citiesWeather[index]);
//                         },
//                         itemCount: citiesWeather.length,
//                       ),
//                     );
//                   }
//                   return const SizedBox.shrink();
//                 },
//               ),




//  FutureBuilder(
//                 future: getCities(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final citiesWeather = snapshot.data ?? [];
//                     return Expanded(
//                       child: ListView.builder(
//                         itemBuilder: (context, index) => OpenContainer(
//                           transitionType: ContainerTransitionType.fade,
//                           transitionDuration: Duration(seconds: 10),
//                           openBuilder: (context, _) => WeatherCityScrren(
//                             weather: citiesWeather[index],
//                           ),
//                           closedBuilder:
//                               (context, VoidCallback OpenContainer) =>
//                                   WeatherCard(
//                             weather: citiesWeather[index],
//                           ),
//                         ),
//                         itemCount: citiesWeather.length,
//                       ),
//                     );
//                   }
//                   return const SizedBox.shrink();
//                 },
//               ),