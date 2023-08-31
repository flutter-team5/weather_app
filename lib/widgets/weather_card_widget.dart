import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.city,
    required this.weather,
    required this.degree,
    required this.time,
  });

  final String city;
  final String weather;
  final int degree;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        gradient: weather == 'Rainy'
            ? LinearGradient(
                colors: [
                  Color.fromARGB(199, 204, 212, 213),
                  Color.fromARGB(193, 154, 188, 255),
                ],
              )
            : weather == 'Sunny'
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
                city,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Spacer(),
              Text(
                weather,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            "${degree}°",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
