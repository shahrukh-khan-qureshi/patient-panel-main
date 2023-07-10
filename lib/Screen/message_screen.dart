import 'package:flutter/material.dart';
import 'package:patient_panel/Screen/chat_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];

  List<String> recentChats = [
    "Dr Name 1",
    "Dr Name 2",
    "Dr Name 3",
    "Dr Name 4",
  ];

  List<String> filteredChats = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredChats = recentChats;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void searchChats(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        filteredChats = recentChats;
      } else {
        filteredChats = recentChats
            .where((chat) => chat.toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Inbox",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: (value) {
                          searchChats(value);
                        },
                        decoration: const InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 102, 102, 235),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "Active Now",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Stack(
                    textDirection: TextDirection.rtl,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 65,
                          width: 65,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "assets/doctor1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(3),
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Recent chats",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredChats.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final chat = filteredChats[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/${imgs[index]}"),
                  ),
                  title: Text(
                    chat,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    "hello",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
