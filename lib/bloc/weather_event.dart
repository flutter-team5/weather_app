part of 'weather_bloc.dart';

abstract class WeatherEvent {}
class GetWeathersEvent extends WeatherEvent {}

class AddWeatherEvent extends WeatherEvent {
  final String name;

  AddWeatherEvent(this.name);
}
