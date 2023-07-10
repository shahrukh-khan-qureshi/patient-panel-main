import 'package:flutter/material.dart';
import 'package:patient_panel/models/medical_record.dart';

class MedicalRecordDetailsScreen extends StatelessWidget {
  final MedicalRecord record;

  MedicalRecordDetailsScreen({required this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Record Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${record.title}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${record.date.toString()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Description:'),
            SizedBox(height: 5),
            Text(record.description),
          ],
        ),
      ),
    );
  }
}
