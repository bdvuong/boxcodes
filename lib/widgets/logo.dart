import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Logo({super.key}) {
    super.key;
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "BoxCodes",
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
