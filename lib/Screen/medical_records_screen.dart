import 'package:flutter/material.dart';
import 'package:patient_panel/Screen/add_medical_record_screen.dart';
import 'package:patient_panel/Screen/view_report_screen.dart';
import 'package:patient_panel/models/medical_record.dart';
import 'package:patient_panel/Screen/booking_screen.dart';
import 'chat_screen.dart';
import 'package:intl/intl.dart';

class MedicalRecordsScreen extends StatefulWidget {
  @override
  _MedicalRecordsScreenState createState() => _MedicalRecordsScreenState();
}

class _MedicalRecordsScreenState extends State<MedicalRecordsScreen> {
  List<MedicalRecord> _medicalRecords = []; // List to store medical records
  int _selectedTabIndex = 0;
  List<bool> _selections = [true, false];

  @override
  void initState() {
    // Fetch medical records from the server or local storage
    _fetchMedicalRecords();
    super.initState();
  }

  void _fetchMedicalRecords() {
    // Simulated fetching of medical records
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _medicalRecords = [
          MedicalRecord(
            id: 1,
            title: 'Check-up',
            date: DateTime.now().subtract(Duration(days: 5)),
            description: 'Routine health check-up',
            doctorName: 'Dr. Smith',
            patientName: 'John Doe',
            filesAttached: 2,
          ),
          MedicalRecord(
            id: 2,
            title: 'X-ray',
            date: DateTime.now().subtract(Duration(days: 10)),
            description: 'X-ray report for ankle injury',
            doctorName: 'Dr. Johnson',
            patientName: 'John Doe',
            filesAttached: 1,
          ),
          MedicalRecord(
            id: 3,
            title: 'Lab Test',
            date: DateTime.now().subtract(Duration(days: 15)),
            description: 'Blood test results',
            doctorName: 'Dr. Smith',
            patientName: 'John Doe',
            filesAttached: 0,
          ),
        ];
      });
    });
  }

  void _deleteMedicalRecord(int id) {
    // Delete the medical record from the list
    setState(() {
      _medicalRecords.removeWhere((record) => record.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back arrow icon
        centerTitle: true,
        title: Text('Medical Records'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16), // Added space before ToggleButtons
          Material(
            elevation: 2,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 55,
              child: ToggleButtons(
                isSelected: _selections,
                onPressed: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                    _selections =
                        List.generate(_selections.length, (i) => i == index);
                  });
                },
                borderRadius: BorderRadius.circular(10), // Rounded borders
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('My Reports'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Doctors Prescriptions'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: _selectedTabIndex == 0
                ? (_medicalRecords.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: _medicalRecords.length,
                        itemBuilder: (context, index) {
                          final record = _medicalRecords[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      record.title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title:
                                                  Text('Delete Medical Record'),
                                              content: Text(
                                                  'Are you sure you want to delete this medical record?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    _deleteMedicalRecord(
                                                        record.id);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.person),
                                    SizedBox(width: 4),
                                    Text(record.patientName),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.medical_services),
                                    SizedBox(width: 4),
                                    Text(record.doctorName),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    SizedBox(width: 4),
                                    Text(
                                      DateFormat('MMMM d, yyyy')
                                          .format(record.date), // Format date
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.attach_file),
                                    SizedBox(width: 4),
                                    Text(
                                      'Files Attached: ${record.filesAttached}',
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // Share report functionality
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ChatScreen(),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.share),
                                      label: Text('Share Report'),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // View report functionality
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ViewReportScreen(
                                                record:
                                                    record), // Pass the current record to ViewReportScreen
                                          ),
                                        ).then((updatedRecord) {
                                          if (updatedRecord != null) {
                                            setState(() {
                                              final index = _medicalRecords
                                                  .indexWhere((element) =>
                                                      element.id ==
                                                      updatedRecord.id);
                                              if (index != -1) {
                                                _medicalRecords[index] =
                                                    updatedRecord;
                                              }
                                            });
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.remove_red_eye),
                                      label: Text('View Report'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ))
                : Container(),
          ),
          _selectedTabIndex == 0
              ? Container(
                  padding: EdgeInsets.all(16),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddMedicalRecordScreen(),
                        ),
                      ).then((newRecord) {
                        if (newRecord != null) {
                          setState(() {
                            _medicalRecords.add(newRecord);
                          });
                        }
                      });
                    },
                    color: Color.fromARGB(255, 15, 170, 241),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                      child: Text(
                        "Add Medical Record",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(16),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigate to the Booking screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Booking(),
                        ),
                      );
                    },
                    color: Color.fromARGB(255, 15, 170, 241),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                      child: Text(
                        "Consult Online",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
