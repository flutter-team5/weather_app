import 'package:bloc/bloc.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/service/database_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {

    on<GetWeathersEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final List<Weather>? weathers = await getCities();
        emit(GetWeathersSuccessedState(weathers));
      } catch (e) {
        emit(FailedState());
      }
    });

    on<AddWeatherEvent>((event, emit) async {
      emit(LoadingState());

      try {
        await insertCity(event.name);
        emit(AddWeatherSuccessedState());
      } catch (e) {
        emit(FailedState());
      }
    });
  }
}
