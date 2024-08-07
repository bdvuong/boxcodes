import 'package:boxcodes/models/box.dart';
import 'package:boxcodes/providers/boxes_provider.dart';
import 'package:boxcodes/screens/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoxesView extends StatefulWidget {
  const BoxesView({super.key});

  @override
  State<BoxesView> createState() => _BoxesViewState();
}

class _BoxesViewState extends State<BoxesView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BoxesProvider>(
      builder: (context, providerItem, child) {
        return FutureBuilder<List<Box>>(
          future: providerItem.boxesData,
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
              shrinkWrap: true,
              itemCount: boxes.length,
              itemBuilder: (context, index) {
                final box = boxes[index];
                return ListTile(
                  title: Text(box.name),
                  subtitle: Text(box.description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditScreen(box: box),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timestamp) {
        Provider.of<BoxesProvider>(context, listen: false).fetchBoxesData();
      },
    );
  }
}
