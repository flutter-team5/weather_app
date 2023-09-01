part of 'weather_bloc.dart';

abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class GetWeathersSuccessedState extends WeatherState {
  final List<Weather>? weathers;

  GetWeathersSuccessedState(this.weathers);
}

final class FailedState extends WeatherState {}

final class LoadingState extends WeatherState {}
