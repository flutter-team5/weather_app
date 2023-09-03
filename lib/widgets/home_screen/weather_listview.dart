import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/screens/weather_city_screen.dart';
import 'package:weather_app/widgets/weather_card_widget.dart';

class WeathersListView extends StatelessWidget {
  const WeathersListView({
    super.key,
    required this.citiesWeather,
  });

  final List<Weather> citiesWeather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 450),
              child: SlideAnimation(
                verticalOffset: 70.0,
                child: FadeInAnimation(
                  child: OpenContainer(
                    closedElevation: 0,
                    openColor: Colors.transparent,
                    closedColor: Colors.transparent,
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: const Duration(seconds: 1),
                    openBuilder: (context, _) => WeatherCityScrren(
                      weather: citiesWeather[index],
                    ),
                    closedBuilder: (context, VoidCallback openContainer) =>
                        WeatherCard(
                      weather: citiesWeather[index],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: citiesWeather.length,
        ),
      ),
    );
  }
}
