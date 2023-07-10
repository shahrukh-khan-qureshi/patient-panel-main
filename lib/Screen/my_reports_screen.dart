import 'package:flutter/material.dart';
import 'package:patient_panel/Screen/add_report_screen.dart';
import 'package:patient_panel/Screen/report_details_screen.dart';
import 'package:patient_panel/models/report.dart';
// import 'package:patient_panel/screens/add_report_screen.dart';
// import 'package:patient_panel/screens/report_details_screen.dart';

class MyReportsScreen extends StatefulWidget {
  @override
  _MyReportsScreenState createState() => _MyReportsScreenState();
}

class _MyReportsScreenState extends State<MyReportsScreen> {
  List<Report> _reports = []; // List to store reports

  @override
  void initState() {
    // Fetch reports from the server or local storage
    _fetchReports();
    super.initState();
  }

  void _fetchReports() {
    // Simulated fetching of reports
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _reports = [
          Report(
            id: 1,
            title: 'Lab Test Report',
            date: DateTime.now().subtract(Duration(days: 5)),
            doctorName: 'Dr. John Doe',
            patientName: 'Alice Smith',
            notes: 'Test results: Normal',
          ),
          Report(
            id: 2,
            title: 'X-ray Report',
            date: DateTime.now().subtract(Duration(days: 10)),
            doctorName: 'Dr. Jane Smith',
            patientName: 'Bob Johnson',
            notes: 'Diagnosis: Fractured bone',
          ),
          Report(
            id: 3,
            title: 'MRI Report',
            date: DateTime.now().subtract(Duration(days: 15)),
            doctorName: 'Dr. David Brown',
            patientName: 'Carol Davis',
            notes: 'Findings: Abnormal growth',
          ),
        ];
      });
    });
  }

  void _deleteReport(int id) {
    // Delete the report from the list
    setState(() {
      _reports.removeWhere((report) => report.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reports'),
      ),
      body: _reports.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _reports.length,
              itemBuilder: (context, index) {
                final report = _reports[index];
                return ListTile(
                  title: Text(report.title),
                  subtitle: Text(report.date.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete Report'),
                            content: Text(
                                'Are you sure you want to delete this report?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _deleteReport(report.id);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  onTap: () {
                    // Handle tapping on a report
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReportDetailsScreen(report: report),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigate to the add report screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddReportScreen(),
            ),
          ).then((newReport) {
            if (newReport != null) {
              setState(() {
                _reports.add(newReport);
              });
            }
          });
        },
      ),
    );
  }
}
