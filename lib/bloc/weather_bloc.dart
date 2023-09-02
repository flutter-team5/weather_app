import 'package:bloc/bloc.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/service/database_service.dart';
import 'package:weather_app/service/weather_service.dart';
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
        if (await isCityFound(event.name)) {
          await insertCity(event.name);
          emit(AddWeatherSuccessedState());
        } else {
          emit(CityNotFoundState());
        }
      } catch (e) {
        emit(FailedState());
      }
    });
  }
}
