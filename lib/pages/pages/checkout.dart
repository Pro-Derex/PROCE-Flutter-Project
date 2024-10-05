import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final List<Map<String, String>> cart;

  const CheckoutPage({super.key, required this.cart});

  double calculateTotalAmount() {
    double total = 0.0;
    for (var item in cart) {
      // Parse the price string to a double after removing the '$' sign
      String priceString = item['price'] ?? '0';
      double price = double.tryParse(priceString.replaceAll('\$', '')) ?? 0.0;
      total += price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = calculateTotalAmount();

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout (${cart.length} items)'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: cart.isEmpty
          ? Center(child: Text('Your cart is empty.'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    cart[index]['imageUrl'] ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(cart[index]['name'] ?? 'Product'),
                  subtitle: Text('Price: ${cart[index]['price'] ?? '0'}'),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
              ),
              onPressed: () {
                // Implement checkout logic here
              },
              child: Text('Complete Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}
