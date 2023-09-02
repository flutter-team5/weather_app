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
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(13),
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(2, 4), // shadow position
            ),
          ],
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
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 170,
                  child: Text(
                    weather.name!,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'ADLaMDisplay-Regular',
                    ),
                  ),
                ),
                Text(
                  weather.formatTime(weather.localtime!),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 150,
                  child: Text(
                    weather.text!,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'ADLaMDisplay-Regular',
                    ),
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
