import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/model/weather.dart';

class LottieWeather extends StatelessWidget {
  const LottieWeather({super.key, required this.weather});

  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return weather.text!.toLowerCase().contains('rainy') ||
            weather.text!.toLowerCase().contains('patchy') ||
            weather.text!.toLowerCase().contains('thunder') ||
            weather.text!.toLowerCase().contains('mist')
        ? Lottie.network(
            "https://lottie.host/52f4e94a-21a8-47fb-81d2-2e2d7f6c534a/HjJehQX5U2.json",
            width: 270,
          )
        : weather.text!.toLowerCase().contains('cloudy') ||
                weather.text!.toLowerCase().contains('overcast')
            ? Lottie.network(
                "https://lottie.host/82865c61-fbd9-4dfa-a926-562c14c26073/ytDM4qQt55.json",
                width: 450,
              )
            : weather.text!.toLowerCase().contains('sunny')
                ? Lottie.network(
                    "https://lottie.host/213b8bd6-ea40-49af-8977-46f5b4671867/ANtgnFluqA.json",
                    width: 350,
                  )
                : const SizedBox();
  }
}
