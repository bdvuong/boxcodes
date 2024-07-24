import 'package:boxcodes/models/box.dart';
import 'package:boxcodes/providers/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:boxcodes/widgets/box_button.dart';

class BoxesView extends StatefulWidget {
  const BoxesView({super.key});

  @override
  State<BoxesView> createState() => _BoxesViewState();
}

class _BoxesViewState extends State<BoxesView> {
  final FirestoreProvider _firestoreProvider = FirestoreProvider();
  late Future<List<Box>> _boxesFuture;

  @override
  void initState() {
    super.initState();
    _boxesFuture = _firestoreProvider.getAllBoxes();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      child: FutureBuilder<List<Box>>(
        future: _boxesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No containers found."),
            );
          }

          final boxes = snapshot.data!;

          return ListView.builder(
              itemCount: boxes.length,
              itemBuilder: (context, index) {
                final box = boxes[index];
                return BoxButton(box: box);
              });
        },
      ),
    );
  }
}
