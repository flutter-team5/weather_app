import 'package:flutter/material.dart';
import 'package:weather_app/extension/navigator.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/widgets/weather_city_screen/city_column_info.dart';
import 'package:weather_app/widgets/weather_city_screen/clear_weather_container.dart';
import 'package:weather_app/widgets/weather_city_screen/custom_continer_widgets.dart';
import 'package:weather_app/widgets/weather_city_screen/lottie_weather.dart';
import 'package:weather_app/widgets/weather_city_screen/weather_column_info.dart';
import 'package:weather_app/widgets/weather_city_screen/weather_container.dart';

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
            child: weather.text!.toLowerCase().contains('rainy') ||
                    weather.text!.toLowerCase().contains('patchy') ||
                    weather.text!.toLowerCase().contains('thunder') ||
                    weather.text!.toLowerCase().contains('mist') ||
                    weather.text!.toLowerCase().contains('cloudy') ||
                    weather.text!.toLowerCase().contains('sunny')
                ? WeatherContainer(weather: weather)
                : const ClearWeatherContainer(),
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
                decoration: BoxDecoration(
                  color: chosenTheme
                      ? const Color.fromARGB(154, 76, 76, 76)
                      : const Color.fromARGB(146, 255, 255, 255),
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
                decoration: BoxDecoration(
                  color: chosenTheme
                      ? const Color.fromARGB(154, 76, 76, 76)
                      : const Color.fromARGB(146, 255, 255, 255),
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
                decoration: BoxDecoration(
                  color: chosenTheme
                      ? const Color.fromARGB(255, 76, 76, 76)
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Positioned(
            top: weather.text!.toLowerCase().contains('cloudy') ||
                    weather.text!.toLowerCase().contains('overcast')
                ? 100
                : 90,
            left: weather.text!.toLowerCase().contains('cloudy') ||
                    weather.text!.toLowerCase().contains('overcast')
                ? 0
                : 200,
            child: LottieWeather(
              //Lottie image will be retured here
              weather: weather,
            ),
          ),
          Positioned(
            top: 115,
            left: 50,
            child: WeatherColumnInfo(weather: weather),
          ),
          Positioned(
            bottom: 70,
            left: 50,
            child: CityColumnInfo(weather: weather),
          ),
        ],
      ),
    );
  }
}
