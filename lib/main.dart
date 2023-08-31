import 'package:flutter/material.dart';
import 'package:weather_app/service/news_service.dart';

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
          future: getNews("London"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.localtime!.hour.toString());
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
