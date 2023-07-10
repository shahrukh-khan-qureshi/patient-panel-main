import 'package:flutter/material.dart';
import 'package:patient_panel/Screen/calling_screen.dart';

import '../widgets/chat_sample.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 37, 156, 224),
          leadingWidth: 30,
          title: Row(children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage("assets/doctor1.jpg"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: Text(
                "Dr Name ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ]),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 8, right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CallingScreen(
                        avatarImage: AssetImage("assets/doctor1.jpg"),
                        doctorName: "Dr Name",
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CallingScreen(
                        avatarImage: AssetImage("assets/doctor1.jpg"),
                        doctorName: "Dr Name",
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.video_call,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, right: 20),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 26,
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 8),
        itemBuilder: (context, index) => ChatSample(),
      ),
      bottomSheet: Container(
        height: 65,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 2,
            blurRadius: 10,
          )
        ]),
        child: Row(children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.add,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.emoji_emotions_outlined,
              color: Colors.yellow,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width / 1.6,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Type your message",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.send,
              size: 30,
              color: Color(0xFF0000FF),
            ),
          )
        ]),
      ),
    );
  }
}
