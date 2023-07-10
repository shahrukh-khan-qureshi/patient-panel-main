import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:patient_panel/Screen/physical_payment.dart';
import 'package:patient_panel/widgets/navbar_roots.dart';

class PaymentPage extends StatefulWidget {
  final double totalPrice;

  PaymentPage({required this.totalPrice});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                'Total Price: \$${widget.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
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
              SizedBox(height: 16.0),
              PaymentCard(
                icon: Icons.store,
                title: 'Physical Payment',
                subtitle: 'Make payment in-store',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhysicalPaymentScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  PaymentCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 2),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32.0,
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
