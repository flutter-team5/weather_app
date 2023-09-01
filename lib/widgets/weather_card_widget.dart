import 'package:flutter/material.dart';
import 'package:weather_app/extension/navigator.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/screens/weather_city_screen.dart';

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
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(13),
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          gradient: weather.text!.toLowerCase().contains('rainy') ||
                  weather.text!.toLowerCase().contains('cloudy')
              ? const LinearGradient(
                  colors: [
                    Color.fromARGB(199, 204, 212, 213),
                    Color.fromARGB(193, 154, 188, 255),
                  ],
                )
              : weather.text!.toLowerCase().contains('sunny')
                  ? const LinearGradient(
                      colors: [
                        Color.fromARGB(181, 255, 133, 160),
                        Color.fromARGB(255, 249, 205, 139)
                      ],
                    )
                  : const LinearGradient(
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
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weather.formatTime(weather.localtime!),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                Text(
                  weather.text!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              "${weather.tempC}°",
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      // onTap: () {
      //   context.push(
      //       screen: WeatherCityScrren(
      //     weather: weather,
      //   ));
      // },
    );
  }
}
