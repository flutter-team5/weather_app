import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';


Future<Weather> getWeather(String query) async {
  final response = await http.get(
    Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=6db1805c54b846e09ce72309233108&q=$query&aqi=no'),
  );
  final responseAsJson = json.decode(response.body);
  final result = Weather.fromJson(responseAsJson);

  return result;
}

Future<bool> isCityFound(String query) async{

  final response = await http.get(
    Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=6db1805c54b846e09ce72309233108&q=$query&aqi=no'),
  );
  
  return !response.body.contains("error");
}
