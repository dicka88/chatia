import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../Dashboard/DashboardScreen.dart';

import '../../theme.dart';

class SetupProfile extends StatefulWidget {
  @override
  SetupProfileState createState() => SetupProfileState();
}

class SetupProfileState extends State<SetupProfile> {
  ImageProvider<Object> _profileImage =
      AssetImage('assets/images/avatar/avatar.png');
  String _profileName = "";
  String _profileBio = "";

  final _formKey = GlobalKey<FormState>();

  void openCamera() async {
    var picture = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _profileImage = Image.file(File(picture!.path)).image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Chatia",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: this.openCamera,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 180,
                              width: 180,
                              child: CircleAvatar(
                                backgroundImage: _profileImage,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              this._profileName = value;
                            });
                          },
                          maxLength: 15,
                          validator: (value) {
                            if (value == '' || value == null)
                              return "Name should be filled";
                            if (value.length >= 15)
                              return "Name should 1-15 character";
                            return null;
                          },
                          style: TextStyle(
                              fontSize: 24,
                              letterSpacing: 1,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            errorText: null,
                            labelStyle: TextStyle(
                              fontSize: 24,
                              letterSpacing: 1,
                              color: Colors.grey,
                            ),
                            hintText: 'Your name',
                            hintStyle: TextStyle(
                              fontSize: 24,
                              letterSpacing: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              this._profileBio = value;
                            });
                          },
                          maxLength: 50,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 24,
                              letterSpacing: 1,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            errorText: null,
                            labelStyle: TextStyle(
                                fontSize: 24,
                                letterSpacing: 1,
                                color: Colors.grey),
                            hintText: 'Your bio (optional)',
                            hintStyle: TextStyle(
                                fontSize: 24,
                                letterSpacing: 1,
                                color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 16, top: 16),
                            child: Container(
                              height: 50,
                              width: 137,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  shadowColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // goto dashboard
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => DashboardScreen(
                                          key: Key("adada"),
                                          profileBio: _profileBio,
                                          profileName: _profileName,
                                          profileImage: _profileImage,
                                        ),
                                      ),
                                      (route) => false,
                                    );
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Next",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child:
                                          FaIcon(FontAwesomeIcons.arrowRight),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        });
  }
}
