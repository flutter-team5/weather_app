import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/constants/colors.dart';

class ClearWeatherContainer extends StatelessWidget {
  const ClearWeatherContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: WColors.lightBlue,
        highlightColor: WColors.whiteBlue,
        period: const Duration(seconds: 5),
        enabled: true,
        child: Container(
          decoration: const BoxDecoration(
            gradient: WColors.clear,
          ),
        ),
      );
  }
}