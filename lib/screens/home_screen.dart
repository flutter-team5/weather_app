import 'package:flutter/material.dart';
import 'package:weather_app/constants/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              //TODO ADD List view Builder
              // WeatherCard(
              //   city: "Riydh",
              //   time: "3:46 AM",
              //   weather: "Sunny",
              //   degree: 39,
              // ),
              // WSpaces.kVspace8,
              // WeatherCard(
              //   city: "Denver",
              //   time: "4:45 AM",
              //   weather: "Rainy",
              //   degree: 18,
              // ),
              // WSpaces.kVspace8,
              // WeatherCard(
              //   city: "Riydh",
              //   time: "3:46 AM",
              //   weather: "Clear",
              //   degree: 39,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}