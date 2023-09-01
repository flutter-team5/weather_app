import 'package:flutter/material.dart';

class CustomDividerH extends StatelessWidget {
  const CustomDividerH({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
      ),
    );
  }
}

class CustomDividerV extends StatelessWidget {
  const CustomDividerV({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey.shade400, width: 2.0),
        ),
      ),
    );
  }
}
