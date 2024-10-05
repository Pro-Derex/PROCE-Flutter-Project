import 'package:flutter/material.dart';
import '../models/product.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
      child: Column(
        children: [
          Image.network(product.imageUrl, height: 100, width: 100, fit: BoxFit.cover),
          Text(product.title),
          Text('\$${product.price.toStringAsFixed(2)}'),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              cart.addItem(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added to cart!')),
              );
            },
          ),
        ],
      ),
    );
  }
}
