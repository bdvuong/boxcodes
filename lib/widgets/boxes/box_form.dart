import 'package:boxcodes/models/box.dart';
import 'package:boxcodes/providers/boxes_provider.dart';
import 'package:boxcodes/providers/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoxForm extends StatefulWidget {
  const BoxForm({
    super.key,
    this.box,
  });
  final Box? box;

  @override
  BoxFormState createState() {
    return BoxFormState();
  }
}

class BoxFormState extends State<BoxForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _description = "";
  String _error = "";

  @override
  Widget build(BuildContext context) {
    final FirestoreProvider firestoreProvider = FirestoreProvider();
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.box == null
                ? const Text("New Container")
                : Text("Editing Box: ${widget.box!.id!}"),
            _error.isNotEmpty ? Text(_error) : const SizedBox.shrink(),
            TextFormField(
              initialValue: widget.box?.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a container name";
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
              decoration: const InputDecoration(
                labelText: "Container Name",
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              initialValue: widget.box?.description,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a description.";
                }
                return null;
              },
              onSaved: (value) {
                _description = value!;
              },
              decoration: const InputDecoration(
                labelText: "Description",
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  Box box = Box(
                    id: widget.box?.id,
                    name: _name,
                    description: _description,
                    createdDate: Timestamp.now(),
                  );

                  try {
                    await firestoreProvider.addBox(box);
                  } catch (e) {
                    _error = e.toString();
                  } finally {
                    if (context.mounted) {
                      Provider.of<BoxesProvider>(
                        context,
                        listen: false,
                      ).fetchBoxesData();
                      Navigator.pop(context);
                    }
                  }
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
