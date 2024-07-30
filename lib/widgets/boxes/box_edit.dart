import 'package:boxcodes/models/box.dart';
import 'package:boxcodes/widgets/boxes/box_form.dart';
import 'package:flutter/material.dart';

class BoxEdit extends StatefulWidget {
  const BoxEdit({super.key, required this.box});
  final Box box;

  @override
  State<StatefulWidget> createState() {
    return BoxEditState();
  }
}

class BoxEditState extends State<BoxEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxForm(box: widget.box),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ),
          Text(widget.box.name),
        ],
      ),
    );
  }
}
