import 'package:flutter/material.dart';
import 'package:boxcodes/models/box.dart';

class BoxButton extends StatefulWidget {
  const BoxButton({
    super.key,
    required this.box,
  });

  final Box box;

  @override
  State<BoxButton> createState() => _BoxButtonState();
}

class _BoxButtonState extends State<BoxButton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.box.name),
      subtitle: Text(widget.box.description),
      onTap: () {
        print(widget.box.name);
      },
    );
  }
}
