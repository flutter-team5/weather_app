import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
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
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WSpaces.kVspace8,
              const Text(
                "Weather",
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'ADLaMDisplay-Regular',
                  //'Rubik-VariableFont_wght'
                  color: Color.fromARGB(157, 0, 0, 0),
                ),
              ),
              WSpaces.kVspace4,
              Container(
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 188, 187, 187),
                      Color.fromARGB(255, 243, 243, 243)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.45],
                    tileMode: TileMode.clamp,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
                child: TextField(
                  expands: false,
                  style: const TextStyle(fontSize: 20.0, color: Colors.black54),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    hintText: 'Search for a city',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Rubik-VariableFont_wght',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
              WSpaces.kVspace16,
              //adding animation
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is LoadingState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 180.0),
                    child: Center(
                      child: Lottie.network(
                        'https://lottie.host/e2cd8a23-9454-4b5f-a76b-ea261a4e0ab0/dvdTaHYG4n.json',
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      //CircularProgressIndicator(),
                    ),
                  );
                } else if (state is GetWeathersSuccessedState) {
                  final citiesWeather = state.weathers ?? [];
                  return WeathersListView(
                    citiesWeather: citiesWeather,
                  );
                } else if (state is FailedState) {
                  return Center(
                    child: Column(
                      children: [
                        WSpaces.kVspace124,
                        Icon(
                          Icons.error_outline_rounded,
                          size: 100,
                          color: Colors.grey.shade500,
                        ),
                        WSpaces.kVspace8,
                        Text(
                          "Oops!",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Rubik-VariableFont_wght',
                            color: Colors.grey.shade500,
                          ),
                        ),
                        WSpaces.kVspace8,
                        Text(
                          "Something went wrong.\nPlease refresh the page.",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Rubik-VariableFont_wght',
                            color: Colors.grey.shade500,
                          ),
                        )
                      ],
                    ),
                  );
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





// FutureBuilder(
//                 future: getCities(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final citiesWeather = snapshot.data ?? [];
//                     return Expanded(
//                       child: ListView.builder(
//                         itemBuilder: (context, index) {
//                           return WeatherCard(weather: citiesWeather[index]);
//                         },
//                         itemCount: citiesWeather.length,
//                       ),
//                     );
//                   }
//                   return const SizedBox.shrink();
//                 },
//               ),




//  FutureBuilder(
//                 future: getCities(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final citiesWeather = snapshot.data ?? [];
//                     return Expanded(
//                       child: ListView.builder(
//                         itemBuilder: (context, index) => OpenContainer(
//                           transitionType: ContainerTransitionType.fade,
//                           transitionDuration: Duration(seconds: 10),
//                           openBuilder: (context, _) => WeatherCityScrren(
//                             weather: citiesWeather[index],
//                           ),
//                           closedBuilder:
//                               (context, VoidCallback OpenContainer) =>
//                                   WeatherCard(
//                             weather: citiesWeather[index],
//                           ),
//                         ),
//                         itemCount: citiesWeather.length,
//                       ),
//                     );
//                   }
//                   return const SizedBox.shrink();
//                 },
//               ),