import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/service/weather_service.dart';

initialiseDatabase() async {
  await Supabase.initialize(
      url: 'https://irhwpnnckixohblmezys.supabase.co',
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlyaHdwbm5ja2l4b2hibG1lenlzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM0ODIyMDksImV4cCI6MjAwOTA1ODIwOX0.XNX7uLK6bQsw4GRcAmg81JeYrc5elxM-WJpFG5YQyUc");
}

Future<List<String>?> getCitiesNames() async {
  final supabase = Supabase.instance.client;
  final List citiesJson = await supabase.from('saved_cities').select();
  final List<String> cities = [];
  for (final city in citiesJson) {
    cities.add(city["city_name"]);
  }
  return cities;
}

Future<List<Weather>?> getCities() async {
  final supabase = Supabase.instance.client;
  final List citiesJson = await supabase.from('saved_cities').select();
  final List<Weather> cities = [];
  for (final city in citiesJson) {
    cities.add(await getWeather(city["city_name"]));
  }
  return cities;
}

Future insertCity(String city) async {
  final supabase = Supabase.instance.client;
  Map name = new Map();
  name["city_name"] = city;

  await supabase.from('saved_cities').insert(name);
}
