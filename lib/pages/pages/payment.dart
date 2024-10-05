import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final double totalAmount;

  const PaymentPage({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Are you sure you want to proceed with the payment?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
              ),
              onPressed: () {
                // Here you can implement the payment processing logic.
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm Payment'),
                      content: Text('You are about to complete your purchase. Do you want to proceed?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle final purchase logic here
                            Navigator.of(context).pop(); // Close the dialog
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Payment Successful!')),
                            );
                            Navigator.of(context).pop(); // Navigate back to Checkout or another page
                          },
                          child: Text('Proceed'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
