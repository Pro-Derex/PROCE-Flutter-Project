import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, String> product;
  final Function(Map<String, String>) onAddToCart;

  const ProductDetailsPage({super.key, required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product['imageUrl']!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              product['name']!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              product['price']!,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Text(
              product['description'] ?? 'No description available.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onAddToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product['name']} added to cart!')),
                );
                Navigator.of(context).pop(); // Go back to the dashboard after adding
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
              ),
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
