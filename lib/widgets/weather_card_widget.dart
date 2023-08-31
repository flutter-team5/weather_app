import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: const EdgeInsets.all(13),
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          gradient: weather.text == 'Rainy'
              ? LinearGradient(
                  colors: [
                    Color.fromARGB(199, 204, 212, 213),
                    Color.fromARGB(193, 154, 188, 255),
                  ],
                )
              : weather.text == 'Sunny'
                  ? LinearGradient(
                      colors: [
                        Color.fromARGB(181, 255, 133, 160),
                        Color.fromARGB(255, 249, 205, 139)
                      ],
                    )
                  : LinearGradient(
                      colors: [
                        Color.fromARGB(255, 184, 243, 250),
                        Color.fromARGB(255, 227, 249, 246)
                      ],
                    ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weather.name!,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weather.formatTime(weather.localtime!),
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Spacer(),
                Text(
                  weather.text!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              "${weather.tempC}°",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
