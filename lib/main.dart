import 'package:flutter/material.dart';
import 'package:weather_app/service/weather_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: FutureBuilder(
          future: getWeather("Jeddah"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.localtime!.hour.toString()),
                  Text(snapshot.data!.localtime!.minute.toString()),
                ],
              );
            }
            return SizedBox(
              child: Text("error"),
            );
          },
        )),
      ),
    );
  }
}
