import 'package:boxcodes/widgets/boxes/boxes_view.dart';
import 'package:boxcodes/widgets/logo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Logo(),
            const BoxesView(),
          ],
        ),
      ),
    );
  }
}
