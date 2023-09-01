import 'package:flutter/material.dart';
import 'package:weather_app/constants/colors.dart';
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
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(13),
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          gradient: weather.text!.toLowerCase().contains('rainy') ||
                  weather.text!.toLowerCase().contains('cloudy')
              ? WColors.cloudy
              : weather.text!.toLowerCase().contains('sunny')
                  ? WColors.sunny
                  : WColors.clear,
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
                    fontWeight: FontWeight.w400,
                    fontFamily: 'ADLaMDisplay-Regular',
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
                    fontFamily: 'ADLaMDisplay-Regular',
                  ),
                ),
              ],
            ),
            Text(
              "${weather.tempC}°",
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w300,
                fontFamily: 'Rubik-VariableFont_wght',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
