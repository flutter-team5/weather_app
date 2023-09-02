import 'package:flutter/material.dart';
import 'package:weather_app/constants/spacing.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/widgets/weather_city_screen/bottom_row.dart';
import 'package:weather_app/widgets/weather_city_screen/custom_dividers.dart';

class CityColumnInfo extends StatelessWidget {
  const CityColumnInfo({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 230,
          child: Text(
            weather.name!,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 33,
              fontFamily: 'ADLaMDisplay-Regular',
            ),
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
        BottomRow(weather: weather),
      ],
    );
  }
}

