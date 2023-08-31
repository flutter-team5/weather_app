import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';

Future<Weather> getNews(String query) async {
  final response = await http.get(
    Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=6db1805c54b846e09ce72309233108&q=London&aqi=no'),
    //headers: {
    //'X-Api-Key': '6db1805c54b846e09ce72309233108',
    //},
  );
  log('Res: ${response.statusCode}');
  final responseAsJson = json.decode(response.body);
  print(responseAsJson);
  final result = Weather.fromJson(responseAsJson);

  return result;
}
