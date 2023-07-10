import 'package:flutter/material.dart';

class PhysicalPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physical Payment'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Make Payment In-Store',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Please proceed to the checkout counter to make the payment in-store.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Store Address:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1234 Store Street, City, Country',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Payment Amount:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'USD 50.00',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Handle physical payment confirmation
                },
                child: Text('Confirm Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
