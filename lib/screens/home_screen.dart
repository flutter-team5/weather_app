import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/constants/spacing.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/screens/weather_city_screen.dart';
import 'package:weather_app/service/database_service.dart';
import 'package:weather_app/widgets/weather_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(GetWeathersEvent());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WSpaces.kVspace8,
              const Text(
                "Weather",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'ADLaMDisplay-Regular',
                ),
              ),
              WSpaces.kVspace4,
              const SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a city',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              WSpaces.kVspace16,
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetWeathersSuccessedState) {
                  final citiesWeather = state.weathers ?? [];
                  return WeathersListView(
                    citiesWeather: citiesWeather,
                  );
                } else if (state is FailedState) {
                  return const Text("Error");
                }

                return const SizedBox.shrink();
              })
            ],
          ),
        ),
      ),
    );
  }
}

class WeathersListView extends StatelessWidget {
  const WeathersListView({
    super.key,
    required this.citiesWeather,
  });

  final List<Weather> citiesWeather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return OpenContainer(
            closedElevation: 0,
            transitionType: ContainerTransitionType.fade,
            transitionDuration: const Duration(seconds: 1),
            openBuilder: (context, _) => WeatherCityScrren(
              weather: citiesWeather[index],
            ),
            closedBuilder: (context, VoidCallback openContainer) => WeatherCard(
              weather: citiesWeather[index],
            ),
          );
        },
        itemCount: citiesWeather.length,
      ),
    );
  }
}
