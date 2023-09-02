import 'package:flutter/material.dart';
import 'package:weather_app/constants/spacing.dart';

class FailedStateMsg extends StatelessWidget {
  const FailedStateMsg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          WSpaces.kVspace124,
          Icon(
            Icons.error_outline_rounded,
            size: 100,
            color: Colors.grey.shade500,
          ),
          WSpaces.kVspace8,
          Text(
            "Oops!",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Rubik-VariableFont_wght',
              color: Colors.grey.shade500,
            ),
          ),
          WSpaces.kVspace8,
          Text(
            "Something went wrong.\nPlease refresh the page.",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Rubik-VariableFont_wght',
              color: Colors.grey.shade500,
            ),
          )
        ],
      ),
    );
  }
}
