import 'package:flutter/material.dart';

class BoxEdit extends StatefulWidget {
  const BoxEdit({super.key});

  @override
  State<StatefulWidget> createState() {
    return BoxEditState();
  }
}

class BoxEditState extends State<BoxEdit> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("This is the box edit page"));
  }
}
