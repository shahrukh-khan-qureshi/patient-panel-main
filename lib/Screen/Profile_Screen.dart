import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patient_panel/Screen/home_screen.dart';

class ProfilePage extends StatefulWidget {
  final File? updatedProfilePic;

  ProfilePage({this.updatedProfilePic});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showPassword = false;

  String _name = 'Shahrukh Khan Qureshi';
  String _email = 'shahrukhkhanqureshi49@.com';
  String _password = '12345678';
  String _location = 'Lahore, Pakistan';
  double _age = 25;
  double _bmi = 23.5;
  double _height = 175;
  double _weight = 70;
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

  void _updateAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Account'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTextField('Full Name', _name, false, (value) {
                  _name = value;
                }),
                buildTextField('E-mail', _email, false, (value) {
                  _email = value;
                }),
                buildTextField('Password', _password, true, (value) {
                  _password = value;
                }),
                buildTextField('Location', _location, false, (value) {
                  _location = value;
                }),
                buildTextField('Age', _age.toString(), false, (value) {
                  _age = double.tryParse(value) ?? 0;
                }),
                buildTextField('BMI', _bmi.toString(), false, (value) {
                  _bmi = double.tryParse(value) ?? 0;
                }),
                buildTextField('Height', _height.toString(), false, (value) {
                  _height = double.tryParse(value) ?? 0;
                }),
                buildTextField('Weight', _weight.toString(), false, (value) {
                  _weight = double.tryParse(value) ?? 0;
                }),
                SizedBox(height: 20),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Calculate health score here based on the updated values
                double healthScore = calculateHealthScore();

                // Perform any other necessary actions
                // ...

                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  double calculateHealthScore() {
    // Perform health score calculation based on age, BMI, height, weight
    // ...

    // Placeholder calculation (just for demonstration)
    double healthScore = (_age + _bmi - _height + _weight) / 4;

    return healthScore;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.updatedProfilePic != null) {
      _profilePic = widget.updatedProfilePic;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            padding: EdgeInsets.only(bottom: 20), // Add bottom padding
            children: [
              SizedBox(height: 25),
              Text(
                'Edit Profile',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: _profilePic != null
                              ? FileImage(_profilePic!) as ImageProvider<Object>
                              : NetworkImage(
                                  'https://www.instagram.com/stories/highlights/17905173607466115/',
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: _editProfilePic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildTextField('Full Name', _name, false, (value) {
                _name = value;
              }),
              buildTextField('E-mail', _email, false, (value) {
                _email = value;
              }),
              buildTextField('Password', _password, true, (value) {
                _password = value;
              }),
              buildTextField('Location', _location, false, (value) {
                _location = value;
              }),
              buildTextField('Age', _age.toString(), false, (value) {
                _age = double.tryParse(value) ?? 0;
              }),
              buildTextField('BMI', _bmi.toString(), false, (value) {
                _bmi = double.tryParse(value) ?? 0;
              }),
              buildTextField('Height', _height.toString(), false, (value) {
                _height = double.tryParse(value) ?? 0;
              }),
              buildTextField('Weight', _weight.toString(), false, (value) {
                _weight = double.tryParse(value) ?? 0;
              }),
              SizedBox(height: 15),
              userProfileCard(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _updateAccount,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userProfileCard() {
    double healthScore = calculateHealthScore();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Health Score',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              healthScore.toStringAsFixed(2),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: _profilePic != null
                    ? FileImage(_profilePic!) as ImageProvider<Object>
                    : NetworkImage(
                        'https://www.instagram.com/stories/highlights/17905173607466115/',
                      ) as ImageProvider<Object>,
              ),
              title: Text(
                _name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age: ${_age.toStringAsFixed(1)}'),
                  Text('BMI: ${_bmi.toStringAsFixed(1)}'),
                  Text('Height: ${_height.toStringAsFixed(1)} cm'),
                  Text('Weight: ${_weight.toStringAsFixed(1)} kg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String labelText,
    String placeholder,
    bool isPasswordTextField,
    Function(String) onChanged,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: TextField(
          obscureText: isPasswordTextField ? !showPassword : false,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
