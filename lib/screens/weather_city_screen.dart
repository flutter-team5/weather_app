import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/spacing.dart';
import 'package:weather_app/extension/navigator.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/widgets/custom_continer_widgets.dart';
import 'package:weather_app/widgets/custom_dividers.dart';

class WeatherCityScrren extends StatelessWidget {
  const WeatherCityScrren({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(181, 255, 133, 160),
                    Color.fromARGB(255, 249, 205, 139)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 5,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.42,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(149, 255, 255, 255),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.42,
            child: ClipPath(
              clipper: CustomClipPath1(),
              child: Container(
                // width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(128, 255, 255, 255),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.42,
            child: ClipPath(
              clipper: CustomClipPath2(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Positioned(
            top: 115,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${weather.tempC}°",
                  style: const TextStyle(
                    fontSize: 60,
                  ),
                ),
                const Text(
                  "Sunny",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                Text(
                  weather.text!,
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Positioned(
            top: 90,
            left: 200,
            child: Lottie.network(
              "https://lottie.host/213b8bd6-ea40-49af-8977-46f5b4671867/ANtgnFluqA.json",
              width: 350,
            ),
          ),
          Positioned(
            bottom: 70,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weather.name!,
                  style: const TextStyle(
                    fontSize: 33,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'ADLaMDisplay-Regular',
                  ),
                ),
                WSpaces.kVspace4,
                const CustomDividerH(),
                WSpaces.kVspace8,
                Text(
                  weather.getDate(),
                  style: const TextStyle(
                    fontSize: 37,
                  ),
                ),
                WSpaces.kVspace4,
                Text(
                  weather.formatTime(weather.localtime!),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                WSpaces.kVspace24,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "HUMDITY",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "${weather.humidity}%",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    WSpaces.kHspace16,
                    const CustomDividerV(),
                    WSpaces.kHspace8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "WIND kph",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "${weather.windKph}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
