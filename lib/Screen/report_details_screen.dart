import 'package:flutter/material.dart';
import 'package:patient_panel/models/report.dart';

class ReportDetailsScreen extends StatelessWidget {
  final Report report;

  ReportDetailsScreen({required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${report.title}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${report.date.toString()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Doctor Name: ${report.doctorName}'),
            SizedBox(height: 10),
            Text('Patient Name: ${report.patientName}'),
            SizedBox(height: 10),
            Text('Notes:'),
            SizedBox(height: 5),
            Text(report.notes),
          ],
        ),
      ),
    );
  }
}
