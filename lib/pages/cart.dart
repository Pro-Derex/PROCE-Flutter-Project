import 'package:flutter/material.dart';
import 'pages/checkout.dart';


class CartPage extends StatelessWidget {
  final List<Map<String, String>> cart;

  const CartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${cart.length} items)'),
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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
          ),
          onPressed: () {
            if (cart.isNotEmpty) {
              Navigator.pushNamed(
                context,
                '/checkout',
                arguments: cart, // Pass the cart to checkout page
              );
            }
          },
          child: Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}
