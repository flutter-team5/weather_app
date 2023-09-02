import 'package:flutter/material.dart';
import 'package:weather_app/constants/spacing.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/widgets/weather_city_screen/custom_dividers.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
