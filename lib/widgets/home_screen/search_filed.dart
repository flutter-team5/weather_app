import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onSubmitted: (value) {
          context.read<WeatherBloc>().add(AddWeatherEvent(value));
        },
      ),
    );
  }
}