import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_panel/Screen/Notification_Screen.dart';

import 'Profile_Screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Setting",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/doctor1.jpg"),
              ),
              title: Text(
                "Dr name",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text("Profile"),
            ),
          ),
          Divider(
            height: 50,
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.person,
                size: 35,
                color: Colors.blue,
              ),
            ),
            title: Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_on_outlined,
                size: 35,
                color: Colors.blue,
              ),
            ),
            title: Text(
              "Notifications",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.history,
                size: 35,
                color: Colors.blue,
              ),
            ),
            title: Text(
              "Patient History",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.report,
                size: 35,
                color: Colors.blue,
              ),
            ),
            title: Text(
              "Record",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          Divider(
            height: 50,
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.redAccent.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout_rounded,
                size: 40,
                color: Colors.redAccent,
              ),
            ),
            title: Text(
              "Logout",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
