import 'package:boxcodes/widgets/boxes/boxes_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BoxesView(),
    );
  }
}
