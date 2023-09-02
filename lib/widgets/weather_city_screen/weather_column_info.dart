import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';

class WeatherColumnInfo extends StatelessWidget {
  const WeatherColumnInfo({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${weather.tempC}°",
          style: const TextStyle(
            fontSize: 60,
            fontFamily: 'Rubik-VariableFont_wght',
          ),
        ),
        SizedBox(
          width: 200,
          child: Text(
            weather.text!,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}