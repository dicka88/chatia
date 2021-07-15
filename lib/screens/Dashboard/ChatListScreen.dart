import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/ChatModel.dart';

// screen
import '../Chat/ChatScreen.dart';
import '../Chat/ProfileScreen.dart';

class ChatListScreen extends StatefulWidget {
  @override
  ChatListScreenState createState() => ChatListScreenState();
}

class ChatListScreenState extends State<ChatListScreen> {
  final List<ChatModel> messageList = [
    ChatModel(
      id: 1,
      photo: "https://randomuser.me/api/portraits/men/60.jpg",
      name: "Abad",
      bio: "Go known",
      phoneNumber: "085155157532",
      isMuted: false,
      isPinned: false,
      messages: [
        MessageModel(
          id: 1313,
          fromMe: false,
          time: '2021-07-10T19:48:22.020',
          type: 'text',
          message: 'Hello world',
          image: null,
          sticker: null,
          audio: null,
          isRead: false,
          isStar: false,
        ),
        MessageModel(
          id: 1313,
          fromMe: true,
          time: '2021-07-10T19:52:22.020',
          type: 'text',
          message: 'Hello ryu',
          image: null,
          sticker: null,
          audio: null,
          isRead: false,
          isStar: false,
        ),
        MessageModel(
          id: 1313,
          fromMe: false,
          time: '2021-07-10T19:52:32.020',
          type: 'text',
          message: 'I have a question for you',
          image: null,
          sticker: null,
          audio: null,
          isRead: false,
          isStar: false,
        ),
        MessageModel(
          id: 1313,
          fromMe: true,
          time: '2021-07-10T19:53:22.020',
          type: 'text',
          message: 'What is that ?',
          image: null,
          sticker: null,
          audio: null,
          isRead: false,
          isStar: false,
        ),
        MessageModel(
          id: 1313,
          fromMe: false,
          time: '2021-07-10T19:53:30.020',
          type: 'text',
          message: 'I need a help, my math exam is so difficult',
          image: null,
          sticker: null,
          audio: null,
          isRead: false,
          isStar: false,
        ),
        MessageModel(
          id: 1313,
          fromMe: true,
          time: '2021-07-10T19:53:35.020',
          type: 'text',
          message: 'Okay, let me to see it',
          image: null,
          sticker: null,
          audio: null,
          isRead: false,
          isStar: false,
        ),
      ],
    ),
    ChatModel(
      id: 2,
      photo: "https://randomuser.me/api/portraits/men/53.jpg",
      name: "Gunawan",
      bio: "Gun on cloud",
      phoneNumber: "085155157532",
      isMuted: false,
      isPinned: false,
      messages: [
        MessageModel(
          id: 313,
          fromMe: false,
          time: '2021-07-12T19:48:22.020',
          type: 'text',
          message: 'Hai',
          image: null,
          sticker: null,
          audio: null,
          isRead: false,
          isStar: false,
        ),
      ],
    ),
  ];

  Widget chatCard({
    required int id,
    required String name,
    required String photo,
    required List messages,
    required bool isPinned,
    required bool isMuted,
  }) {
    final lastMessage = messages.last;
    final lastTime =
        DateFormat("HH:mm").format(DateTime.parse(lastMessage.time));
    final unreadCount =
        messages.where((it) => it.isRead == false && it.fromMe == false).length;

    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
      },
      child: Container(
        padding: EdgeInsets.only(left: 24, top: 16, bottom: 16, right: 24),
        margin: EdgeInsets.only(bottom: 3),
        color: Colors.white,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => ProfileScreen(),
                  ),
                );
              },
              child: SizedBox(
                width: 40,
                child: CircleAvatar(
                  foregroundImage: Image.network(photo).image,
                  backgroundImage:
                      AssetImage('assets/images/avatar/avatar.png'),
                  backgroundColor: Colors.grey,
                ),
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
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      lastMessage.message,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 40,
              child: Column(
                children: [
                  Text("$lastTime"),
                  Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent, shape: BoxShape.circle),
                    child: unreadCount > 0
                        ? Text(
                            unreadCount.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        : Container(),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.grey[100],
                  child: Column(
                    children: messageList
                        .map(
                          (e) => chatCard(
                            id: e.id,
                            name: e.name,
                            photo: e.photo,
                            messages: e.messages,
                            isMuted: e.isMuted,
                            isPinned: e.isPinned,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            right: 24,
            child: GestureDetector(
              onTap: () {
                print("Float button pressed");
              },
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.messenger,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
