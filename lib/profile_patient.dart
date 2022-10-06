import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoaded = false;
  File? _image;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi du patient'),
        backgroundColor: const Color(0xFF216DAD),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: isLoaded
                      ? Column(
                          children: [
                            Image.file(
                              _image!,
                              height: 150,
                            ),
                            /*Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () async {
                                    await _image!.delete();
                                    setState(() {
                                      isLoaded = false;
                                    });
                                  },
                                  icon: Icon(Icons.delete_outline),
                                  label: Text(''),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () async {
                                    final pickedFile = await ImagePicker().getImage(
                                      source: ImageSource.gallery,
                                      maxHeight: 150,
                                      maxWidth: 150,
                                      imageQuality: 100,
                                    );
                                    if (pickedFile != null) {
                                      setState(() {
                                        _image = File(pickedFile.path);
                                        isLoaded = true;
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.camera_alt_outlined),
                                  label: Text(''),
                                ),
                              ],
                            ),*/
                          ],
                        )
                      : InkWell(
                          child: Placeholder(
                            color: Colors.transparent,
                            child: CircleAvatar(
                              child: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.white70,
                                size: 80,
                              ),
                              backgroundColor: Colors.grey,
                              maxRadius: 50,
                            ),
                            fallbackHeight: 150,
                            fallbackWidth: 150,
                          ),
                          onTap: () async {
                            final pickedFile = await ImagePicker().getImage(
                              source: ImageSource.gallery,
                              maxHeight: 150,
                              maxWidth: 150,
                              imageQuality: 100,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                _image = File(pickedFile.path);
                                isLoaded = true;
                              });
                            }
                          },
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
