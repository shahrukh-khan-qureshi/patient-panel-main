import 'package:flutter/material.dart';
import 'package:patient_panel/Screen/appointment_screen.dart';
import 'package:patient_panel/Screen/home_screen.dart';
import 'package:patient_panel/widgets/navbar_roots.dart';

class PaymentPage extends StatelessWidget {
  final double totalPrice;

  PaymentPage({required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'CNIC',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'address',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'phone number',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement JazzCash integration logic here
                // This could involve making API calls, handling responses, etc.
                // For simplicity, let's assume the payment is successful
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Payment Successful'),
                      content: Text('Thank you for your payment!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavbarRoots(),
                              ),
                            );
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
