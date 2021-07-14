import 'package:flutter/material.dart';

import 'ChatListScreen.dart';
import 'CallScreen.dart';
import 'SearchOverlay.dart';

import '../Chat/ProfileScreen.dart';
import '../Setting/SettingScreen.dart';

class DashboardScreen extends StatefulWidget {
  final ImageProvider profileImage;
  final String profileName;
  final String profileBio;

  DashboardScreen(
      {required Key key,
      required this.profileName,
      required this.profileBio,
      required this.profileImage})
      : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class PopupItem {
  String value;
  String name;
  Widget icon;

  PopupItem(this.value, this.name, this.icon);
}

class DashboardScreenState extends State<DashboardScreen> {
  void searchPressHandler() {
    Navigator.of(context).push(SearchOverlay());
  }

  void popupMenuSelected(value) {
    switch (value) {
      case 'profile':
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (builder) => ProfileScreen()));
        break;
      case 'setting':
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (builder) => SettingScreen()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            // centerTitle: true,
            title: Text(
              "Chatia",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            titleSpacing: 25,
            backgroundColor: Colors.blueAccent,
            actions: [
              IconButton(
                  onPressed: searchPressHandler, icon: Icon(Icons.search)),
              PopupMenuButton(
                itemBuilder: (context) => <PopupItem>[
                  PopupItem(
                      'contact',
                      "Contact",
                      Icon(
                        Icons.contacts,
                        color: Colors.black,
                      )),
                  PopupItem(
                      'profile',
                      "Profile",
                      Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                  PopupItem(
                      'setting',
                      "Setting",
                      Icon(
                        Icons.settings,
                        color: Colors.black,
                      ))
                ].map((PopupItem item) {
                  return PopupMenuItem(
                    value: item.value,
                    child: Row(children: [
                      Container(
                        child: item.icon,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2),
                        child: Text(item.name),
                      )
                    ]),
                  );
                }).toList(),
                icon: Icon(Icons.more_vert),
                onSelected: popupMenuSelected,
              )
            ],
            bottom: TabBar(
              indicatorColor: Colors.blue[700],
              indicatorWeight: 5,
              // isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(Icons.message),
                  text: "Chats",
                ),
                Tab(
                  icon: Icon(Icons.phone),
                  text: "Calls",
                )
              ],
            )),
        body: TabBarView(
          children: [ChatListScreen(), CallScreen()],
        ),
      ),
    );
  }
}
