import 'package:flutter/material.dart';
import 'package:patient_panel/models/medical_record.dart';

class ViewReportScreen extends StatefulWidget {
  final MedicalRecord record;

  ViewReportScreen({required this.record});

  @override
  _ViewReportScreenState createState() => _ViewReportScreenState();
}

class _ViewReportScreenState extends State<ViewReportScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _doctorNameController = TextEditingController();
  TextEditingController _patientNameController = TextEditingController();

  @override
  @override
  void initState() {
    super.initState();
    _titleController.text = widget.record.title ?? '';
    _descriptionController.text = widget.record.description ?? '';
    _doctorNameController.text = widget.record.doctorName ?? '';
    _patientNameController.text = widget.record.patientName ?? '';
  }

  void _updateMedicalRecord() {
    final String title = _titleController.text.trim();
    final String description = _descriptionController.text.trim();
    final String doctorName = _doctorNameController.text.trim();
    final String patientName = _patientNameController.text.trim();

    if (title.isNotEmpty &&
        description.isNotEmpty &&
        doctorName.isNotEmpty &&
        patientName.isNotEmpty) {
      final updatedRecord = MedicalRecord(
        id: widget.record.id,
        title: title,
        date: widget.record.date,
        description: description,
        doctorName: doctorName,
        patientName: patientName,
        filesAttached: 1,
      );

      Navigator.pop(context, updatedRecord);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all the fields'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _deleteFile() {
    setState(() {
      widget.record.filesAttached--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('View Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.description,
                          size: 40,
                        ),
                        SizedBox(height: 9),
                        Text(
                          'Uploaded Files: ${widget.record.filesAttached}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 9),
                        widget.record.filesAttached > 0
                            ? Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10.0),
                                  onTap: () {
                                    _deleteFile();
                                  },
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          170, // Set the desired width here
                                    ),
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.attach_file,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Delete File',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Title',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: 'Enter title',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                maxLines: 4, // Increase the height of the description field
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: 'Enter description',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Doctor Name',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _doctorNameController,
                decoration: InputDecoration(
                  labelText: 'Doctor Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: 'Enter doctor name',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Patient Name',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _patientNameController,
                decoration: InputDecoration(
                  labelText: 'Patient Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: 'Enter patient name',
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity, // Set the desired width here
                child: ElevatedButton(
                  onPressed: _updateMedicalRecord,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 15, 170, 241),
                    ),
                  ),
                  child: Text(
                    'Update Record',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
