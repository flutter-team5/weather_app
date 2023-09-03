import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/app_theme/app_theme.dart';
import 'package:weather_app/bloc/theme_bloc/theme_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/constants/spacing.dart';
import 'package:weather_app/widgets/home_screen/failed_state_msg.dart';
import 'package:weather_app/widgets/home_screen/search_filed.dart';
import 'package:weather_app/widgets/home_screen/weather_listview.dart';

bool chosenTheme = true;

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(GetWeathersEvent());
    final lightTheme = AppTheme.values[0];
    final darkTheme = AppTheme.values[1];

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WSpaces.kVspace8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Weather",
                    style: TextStyle(
                      fontSize: 38,
                      fontFamily: 'ADLaMDisplay-Regular',
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<ThemeBloc>().add(ThemeChanged(
                            theme: chosenTheme ? lightTheme : darkTheme));
                        chosenTheme = !chosenTheme;
                      },
                      icon: const Icon(Icons.sunny))
                ],
              ),
              WSpaces.kVspace4,
              const SearchField(),
              WSpaces.kVspace16,
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 180.0),
                      child: Center(
                        child: Lottie.network(
                          'https://lottie.host/e2cd8a23-9454-4b5f-a76b-ea261a4e0ab0/dvdTaHYG4n.json',
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                    );
                  } else if (state is GetWeathersSuccessedState) {
                    final citiesWeather = state.weathers ?? [];
                    return WeathersListView(
                      citiesWeather: citiesWeather,
                    );
                  } else if (state is AddWeatherSuccessedState) {
                    context.read<WeatherBloc>().add(GetWeathersEvent());
                  } else if (state is CityNotFoundState) {
                    context.read<WeatherBloc>().add(GetWeathersEvent());
                  } else if (state is FailedState) {
                    return const FailedStateMsg();
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
