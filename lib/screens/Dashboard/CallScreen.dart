import 'package:chatia/helpers/ToastHelper.dart';
import 'package:flutter/material.dart';

import '../Chat/ProfileScreen.dart';

class CallScreen extends StatefulWidget {
  @override
  CallScreenState createState() => CallScreenState();
}

class CallModel {
  int id;
  String photo;
  String firstname;
  String lastname;
  String number;
  String timestamp;
  bool isMisscall;
  String duration;

  CallModel(
    this.id,
    this.photo,
    this.firstname,
    this.lastname,
    this.number,
    this.isMisscall,
    this.duration,
    this.timestamp,
  );
}

class CallScreenState extends State<CallScreen> {
  List<CallModel> callList = [
    CallModel(
      1,
      'https://randomuser.me/api/portraits/women/31.jpg',
      "Carlina",
      "Willy",
      '085155155155',
      true,
      '13:12',
      '2021-07-07 12:33:45',
    ),
    CallModel(
      2,
      'https://randomuser.me/api/portraits/men/4.jpg',
      "Steve",
      "John",
      '087543553414',
      false,
      '13:12',
      '2021-07-07 12:33:45',
    ),
    CallModel(
      3,
      'https://randomuser.me/api/portraits/men/64.jpg',
      "Alex",
      "Sir Fergusion",
      '073533244224',
      true,
      '13:12',
      '2021-07-07 12:33:45',
    ),
    CallModel(
      4,
      'https://randomuser.me/api/portraits/men/73.jpg',
      "Chris",
      "Gor",
      '086451748149',
      true,
      '13:12',
      '2021-07-07 12:33:45',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        margin: EdgeInsets.only(bottom: 3),
        color: Colors.grey[200],
        // child: SingleChildScrollView(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: callList
              .map(
                (call) => Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    left: 18,
                    top: 8,
                    bottom: 8,
                    right: 18,
                  ),
                  margin: EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            showToast(context: context, message: "Soon");
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (builder) => ProfileScreen(),
                            //   ),
                            // );
                          },
                          child: SizedBox(
                            width: 40,
                            child: CircleAvatar(
                              foregroundImage: Image.network(call.photo).image,
                              backgroundImage:
                                  AssetImage('assets/images/avatar/avatar.png'),
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Transform.rotate(
                          angle: call.isMisscall ? 180 : 45,
                          child: Icon(
                            Icons.arrow_upward,
                            color: call.isMisscall ? Colors.red : Colors.green,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          margin: EdgeInsets.only(left: 14, right: 14),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    call.firstname + ' ' + call.lastname,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Today, 13:34",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Container(
                            margin: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                            child: TextButton(
                              onPressed: () {
                                showToast(
                                  context: context,
                                  message: "Phone calling soon",
                                );
                              },
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        // ),
      ),
    );
  }
}
