import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/constants/spacing.dart';
import 'package:weather_app/extension/navigator.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/widgets/custom_continer_widgets.dart';
import 'package:weather_app/widgets/custom_dividers.dart';


class WeatherCityScrren extends StatelessWidget {
  const WeatherCityScrren({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.75,
            child: weather.text!.toLowerCase().contains('rainy') ||
                    weather.text!.toLowerCase().contains('patchy') ||
                    weather.text!.toLowerCase().contains('cloudy') ||
                    weather.text!.toLowerCase().contains('sunny')
                ? Container(
                    decoration: BoxDecoration(
                      gradient: weather.text!.toLowerCase().contains('rainy') ||
                              weather.text!.toLowerCase().contains('patchy')
                          ? WColors.rainy
                          : weather.text!.toLowerCase().contains('cloudy') ||
                                  weather.text!
                                      .toLowerCase()
                                      .contains('overcast')
                              ? WColors.cloudy
                              : weather.text!.toLowerCase().contains('sunny')
                                  ? WColors.sunny
                                  : WColors.clear,
                    ),
                  )
                : Shimmer.fromColors(
                    baseColor: WColors.lightBlue,
                    highlightColor: WColors.whiteBlue,
                    period: const Duration(seconds: 5),
                    enabled: true,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: weather.text!.toLowerCase().contains('rainy')
                            ? WColors.rainy
                            : weather.text!.toLowerCase().contains('cloudy') ||
                                    weather.text!
                                        .toLowerCase()
                                        .contains('overcast')
                                ? WColors.cloudy
                                : weather.text!.toLowerCase().contains('sunny')
                                    ? WColors.sunny
                                    : WColors.clear,
                      ),
                    ),
                  ),
          ),
          Positioned(
            top: 40,
            left: 5,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.42,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(149, 255, 255, 255),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.42,
            child: ClipPath(
              clipper: CustomClipPath1(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(128, 255, 255, 255),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.42,
            child: ClipPath(
              clipper: CustomClipPath2(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Positioned(
            top: weather.text!.toLowerCase().contains('cloudy') ||
                    weather.text!.toLowerCase().contains('overcast')
                ? 100
                : 90,
            left: weather.text!.toLowerCase().contains('cloudy') ||
                    weather.text!.toLowerCase().contains('overcast')
                ? 0
                : 200, //
            child: weather.text!.toLowerCase().contains('rainy') ||
                    weather.text!.toLowerCase().contains('patchy')||
                    weather.text!.toLowerCase().contains('thunder')
                ? Lottie.network(
                    "https://lottie.host/52f4e94a-21a8-47fb-81d2-2e2d7f6c534a/HjJehQX5U2.json",
                    width: 300,
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
                        : const SizedBox(),
          ),
          Positioned(
            top: 115,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${weather.tempC}°",
                  style: const TextStyle(
                    fontSize: 60,
                    fontFamily: 'Rubik-VariableFont_wght',
                  ),
                ),
                Text(
                  weather.text!,
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 70,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weather.name!,
                  style: const TextStyle(
                    fontSize: 33,
                    fontFamily: 'ADLaMDisplay-Regular',
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
                Row(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
