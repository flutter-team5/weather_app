import 'package:flutter/material.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/model/weather.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: weather.text!.toLowerCase().contains('rainy') ||
                weather.text!.toLowerCase().contains('patchy') ||
                weather.text!.toLowerCase().contains('mist')
            ? WColors.rainy
            : weather.text!.toLowerCase().contains('cloudy') ||
                    weather.text!.toLowerCase().contains('overcast')
                ? WColors.cloudy
                : weather.text!.toLowerCase().contains('sunny')
                    ? WColors.sunny
                    : WColors.clear,
      ),
    );
  }
}
