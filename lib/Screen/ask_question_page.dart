import 'package:flutter/material.dart';

class AskQuestionPage extends StatefulWidget {
  @override
  _AskQuestionPageState createState() => _AskQuestionPageState();
}

class _AskQuestionPageState extends State<AskQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the drawer page
          },
        ),
        title: Text('Ask your Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'For whom are you asking?',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Location',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  hintText: 'Problem Title (Max 50 characters)',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Describe the problem in detail',
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement functionality to post the question here
                    // For example, you can send the question to a backend API
                    // or save it locally depending on your application's design.
                  },
                  child: Text('Post Question'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 54, 190, 59),
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
