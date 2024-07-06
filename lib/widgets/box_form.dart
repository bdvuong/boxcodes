import 'package:boxcodes/models/box.dart';
import 'package:boxcodes/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoxForm extends StatefulWidget {
  const BoxForm({super.key});

  @override
  BoxFormState createState() {
    return BoxFormState();
  }
}

class BoxFormState extends State<BoxForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _description = "";

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a description.";
                }
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
                      id: "",
                      name: _name,
                      description: _description,
                      createdDate: Timestamp.now(),
                    );

                    await firestoreService.addBox(box);

                    // if (context.mounted) {
                    //   Navigator.pop(context);
                    // }
                  }
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
