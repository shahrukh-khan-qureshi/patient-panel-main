import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patient_panel/Screen/HospitalListScreen.dart';
import 'package:patient_panel/Screen/Notification_Screen.dart';
import 'package:patient_panel/Screen/Profile_Screen.dart';
import 'package:patient_panel/Screen/appointment_screen.dart';
import 'package:patient_panel/Screen/findDoctor_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_panel/Screen/schedule_screen.dart';
import 'Payment_Screen.dart';
import 'ask_question_page.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'hospital_data.dart';
import 'medical_records_screen.dart';
import 'privacy_policy.dart';
// import 'health_blog_screen.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchQuery = '';

  List<Hospital> getFilteredHospitals() {
    if (searchQuery.isEmpty) {
      return HospitalData.hospitals;
    } else {
      return HospitalData.hospitals.where((hospital) {
        return hospital.area.title
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            hospital.department
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            hospital.name.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  String PopbuttonValue = "";
  late String DrawerSelector = "Home";
  void _updateSelectedUser(String user) {
    setState(() {
      DrawerSelector = user;
    });
  }

  File? _profilePic;

  Future<void> _editProfilePic() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profilePic = File(pickedFile.path);
      });
    }
  }

  List<String> speciality = [
    "Allergist",
    "Anesthesiologist",
    "Cardiologist",
    "Dentist",
    "Dermatologist",
    "Endocrinologist",
    "Gastroenterologist",
    "General Practitioner",
    "Hematologist",
    "Infectious Disease Specialist",
    "Internist",
    "Neurologist",
    "Neurosurgeon",
    "Obstetrician",
    "Oncologist",
    "Ophthalmologist",
    "Orthopedic Surgeon",
    "Otolaryngologist (ENT)",
    "Pediatrician",
    "Plastic Surgeon",
    "Psychiatrist",
    "Pulmonologist",
    "Radiologist",
    "Rheumatologist",
    "Surgeon",
    "Urologist",
  ];
  List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final filteredHospitals = getFilteredHospitals();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          'Hospital Service',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: drawerWidget(
        updateSelectedUser: _updateSelectedUser,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello Shahrukh",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        final updatedProfilePic = await Navigator.push<File?>(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProfilePage(updatedProfilePic: _profilePic),
                          ),
                        );

                        if (updatedProfilePic != null) {
                          setState(() {
                            _profilePic = updatedProfilePic;
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color.fromARGB(255, 35, 159, 231),
                        backgroundImage: _profilePic != null
                            ? FileImage(_profilePic!)
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by Area, Treatment, Hospital',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      labelText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // searchQuery = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => FindDoctor()),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 22, 125, 221),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Material(
                                  elevation: 7,
                                  shape: CircleBorder(),
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.pin_drop_outlined,
                                    color: Colors.red,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Doctor Near You          ",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Make an appointment     ",
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 241, 235, 235),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HospitalListScreen(
                              // area: areas[0],
                              ),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 235, 235, 238),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Material(
                                  elevation: 7,
                                  shape: CircleBorder(),
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.local_hospital,
                                    color: Color.fromRGBO(255, 17, 0, 1),
                                    size: 35,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Check Treatment          ",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Check Treatment \n you want      ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "What are you looking for?",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: speciality.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F6FA),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 2,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            speciality[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Popular Doctors',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: imgs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppointmentScreen(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/${imgs[index]}",
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 241, 235, 235),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 31, 230, 74),
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr. Julia Martin",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "Cardiologist",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Appointments ',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Material(
                              child: ScheduleScreen(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Material(
                              child: ScheduleScreen(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                "17 July 2023",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Appointment with",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Dr. Sarah Johnson",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Department",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Dermatology",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Time",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "09:00 AM - 10:00 AM",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Our Services",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Material(
                                  child: ScheduleScreen(),
                                ),
                              ),
                            );
                          },
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    spreadRadius: 4,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 241, 235, 235),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Material(
                                      elevation: 7,
                                      shape: CircleBorder(),
                                      color: Colors.white,
                                      child: Icon(
                                        Icons.date_range,
                                        color: Color(0xFF0000FF),
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Appointments",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Manage your appointments",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Material(
                                  child: HospitalsScreen(),
                                ),
                              ),
                            );
                          },
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    spreadRadius: 4,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 241, 235, 235),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Material(
                                      elevation: 7,
                                      shape: CircleBorder(),
                                      color: Colors.white,
                                      child: Icon(
                                        Icons.local_hospital,
                                        color: Color(0xFF0000FF),
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Hospital",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF0000FF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Find hospitals nearby",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Material(
                                  child: MedicalRecordsScreen(),
                                ),
                              ),
                            );
                          },
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    spreadRadius: 4,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 241, 235, 235),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Material(
                                      elevation: 7,
                                      shape: CircleBorder(),
                                      color: Colors.white,
                                      child: Icon(
                                        Icons.article,
                                        color: Color(0xFF0000FF),
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Medical Records",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF0000FF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "View your medical history",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Health Tips",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7),
                height: 180,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // image: DecorationImage(
                          //   image: AssetImage(
                          //     "Logo3.jpg",
                          //   ),
                          //   fit: BoxFit.cover,
                          // ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/wave_design_image.png",
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 40,
                              left: 10,
                              child: Text(
                                "7 Healthy Habits\nfor a Better Life",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 10,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Read more",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              // Expanded(
              //   child: SizedBox(
              //     child: GridView.builder(
              //       itemCount: filteredHospitals.length,
              //       padding: EdgeInsets.all(10),
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         crossAxisSpacing: 10,
              //         mainAxisSpacing: 10,
              //       ),
              //       itemBuilder: (BuildContext context, int index) {
              //         Hospital hospital = filteredHospitals[index];
              //         return InkWell(
              //           onTap: () {
              //             // Handle tapping on a hospital
              //           },
              //           child: Material(
              //             elevation: 8,
              //             borderRadius: BorderRadius.circular(10),
              //             child: SizedBox(
              //               width: double.infinity,
              //               height: double.infinity,
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(10),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Colors.black12,
              //                       blurRadius: 6,
              //                       spreadRadius: 4,
              //                     ),
              //                   ],
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Container(
              //                       height: 120,
              //                       decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.only(
              //                           topLeft: Radius.circular(10),
              //                           topRight: Radius.circular(10),
              //                         ),
              //                         image: DecorationImage(
              //                           image: NetworkImage(hospital.imageLink),
              //                           fit: BoxFit.cover,
              //                         ),
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: EdgeInsets.all(10),
              //                       child: Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: [
              //                           Text(
              //                             hospital.name,
              //                             style: TextStyle(
              //                               fontSize: 16,
              //                               fontWeight: FontWeight.bold,
              //                             ),
              //                           ),
              //                           SizedBox(height: 5),
              //                           Text(
              //                             hospital.department,
              //                             style: TextStyle(
              //                               color: Colors.grey,
              //                               fontSize: 12,
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),

              // Container(height: 200, child: HealthBlogScreen()),
            ],
          ),
        ),
      ),
    );
  }
}

class drawerWidget extends StatefulWidget {
  final Function(String) updateSelectedUser;
  const drawerWidget({required this.updateSelectedUser});

  @override
  State<drawerWidget> createState() => _drawerWidgetState();
}

class _drawerWidgetState extends State<drawerWidget> {
  String DrawerSelector = "Home";
  File? _profilePic;

  Future<void> _editProfilePic() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profilePic = File(pickedFile.path);
      });
    }
  }

  void logout() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Logging out..."),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        DrawerSelector = "Home";
      });
      widget.updateSelectedUser(DrawerSelector);
    });
  }

  void shareToFriend() {
    final String message = "Check out this awesome app!";
    Share.share(message);
  }

  void contactUs() async {
    final String email = "70078100@student.uol.edu.pk";
    final String subject = "Regarding Your App";
    final String body =
        "Hi,\n\nI have a question about your app. Can you please help me with that?\n\nThanks.";

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    final String url = emailUri.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('No email clients found!');
    }
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String feedbackText = '';

        return AlertDialog(
          title: Text("Feedback"),
          content: TextField(
            onChanged: (value) {
              feedbackText = value;
            },
            decoration: InputDecoration(
              hintText: "Enter your feedback here...",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                print("Feedback: $feedbackText");
                Navigator.pop(context);
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(246, 248, 248, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    final updatedProfilePic = await Navigator.push<File?>(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(updatedProfilePic: _profilePic),
                      ),
                    );

                    if (updatedProfilePic != null) {
                      setState(() {
                        _profilePic = updatedProfilePic;
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Color.fromARGB(255, 35, 159, 231),
                    backgroundImage:
                        _profilePic != null ? FileImage(_profilePic!) : null,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            selected: DrawerSelector == "Appointments",
            leading: Icon(Icons.calendar_month),
            title: Text("Appointments"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "Appointments";
              });
              widget.updateSelectedUser(DrawerSelector);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Material(
                    child: ScheduleScreen(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            selected: DrawerSelector == "doctor",
            leading: Icon(Icons.search),
            title: Text("Search Doctor"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "doctor";
              });
              widget.updateSelectedUser(DrawerSelector);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindDoctor()),
              );
            },
          ),
          ListTile(
            selected: DrawerSelector == "hospital",
            leading: Icon(Icons.local_hospital),
            title: Text("Search Hospitals"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "hospital";
              });
              widget.updateSelectedUser(DrawerSelector);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HospitalListScreen()),
              );
            },
          ),
          ListTile(
            selected: DrawerSelector == "payment",
            leading: Icon(Icons.payment),
            title: Text("Payment"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "payment";
              });
              widget.updateSelectedUser(DrawerSelector);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentPage(
                          totalPrice: 1,
                        )),
              );
            },
          ),
          ListTile(
            selected: DrawerSelector == "AskQuestion",
            leading: Icon(Icons.question_answer),
            title: Text("Ask a Question"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "AskQuestion";
              });
              widget.updateSelectedUser(DrawerSelector);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AskQuestionPage()),
              );
            },
          ),
          ListTile(
            selected: DrawerSelector == "feedback",
            leading: Icon(Icons.feedback),
            title: Text("Feedback"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "feedback";
              });
              widget.updateSelectedUser(DrawerSelector);
              _showFeedbackDialog(context);
            },
          ),
          ListTile(
            selected: DrawerSelector == "Policy",
            leading: Icon(Icons.policy),
            title: Text("Our Policy"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              setState(() {
                DrawerSelector = "Policy";
              });
              widget.updateSelectedUser(DrawerSelector);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Material(
                    child: PrivacyPolicy(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              logout();
            },
          ),
          Expanded(child: Container()),
          Divider(thickness: 1),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share to Friend"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              shareToFriend();
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact Us"),
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            onTap: () {
              contactUs();
            },
          ),
        ],
      ),
    );
  }
}

// class HealthBlog {
//   final String title;
//   final String imageUrl;

//   HealthBlog({
//     required this.title,
//     required this.imageUrl,
//     required String content,
//   });
// }

// Future<List<HealthBlog>> fetchHealthBlogs() async {
//   List<String> healthBlogUrls = [
//     'https://medlineplus.gov/rss.html',
//     'https://www.webmd.com/rss-feeds',
//     'https://www.health.com/syndication',
//     //  'MedlinePlus.gov',
//     // 'https://medlineplus.gov/api/',
//     // 'https://www.healthline.com/developers/api-documentation',
//     // 'https://developer.mayoclinic.org/',
//     // ' https://developer.webmd.com/',
//     // 'https://www.healthdata.gov/',
//   ];

//   List<HealthBlog> allHealthBlogs = [];

//   for (String apiUrl in healthBlogUrls) {
//     final response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       // Parse the response and extract health blog data
//       List<HealthBlog> healthBlogs = parseHealthBlogs(response.body);
//       allHealthBlogs.addAll(healthBlogs);
//     } else {
//       // Handle error if the API request fails
//       print('Failed to fetch data from $apiUrl');
//     }
//   }

//   return allHealthBlogs;
// }

// List<HealthBlog> parseHealthBlogs(String jsonData) {
//   final parsedData = jsonDecode(jsonData);
//   List<HealthBlog> healthBlogs = [];

//   for (var blog in parsedData) {
//     String title = blog['title'];
//     String imageUrl = blog['image_url'];
//     String content = blog['content'];

//     HealthBlog healthBlog =
//         HealthBlog(title: title, imageUrl: imageUrl, content: content);
//     healthBlogs.add(healthBlog);
//   }

//   return healthBlogs;
// }
