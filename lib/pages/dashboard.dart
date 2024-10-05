import 'package:flutter/material.dart';
import 'package:proce_app/pages/cart.dart';
import 'pages/cart.dart';
import 'pages/product_details.dart';
import 'pages/product_details.dart';



class DashboardPage extends StatefulWidget {
  final List<Map<String, String>> cart;

  const DashboardPage({super.key, required this.cart});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Sample products data
  final List<Map<String, String>> products = [
    {
      'name': 'Apple iPhone 13',
      'price': '\$799',
      'imageUrl': 'https://tinyurl.com/3n3ppyx7',
      'description': 'Latest Apple iPhone with A15 Bionic chip.'
    },
    {
      'name': 'Samsung Galaxy S21',
      'price': '\$699',
      'imageUrl': 'https://tinyurl.com/2p8c2p8s',
      'description': 'Powerful smartphone with excellent camera.'
    },
    {
      'name': '50kg Bag of Rice',
      'price': '\$80',
      'imageUrl': 'https://tinyurl.com/yv2fc8pz',
      'description': 'High quality rice, perfect for any meal.'
    },
    {
      'name': 'Nike Air Max',
      'price': '\$199',
      'imageUrl': 'https://tinyurl.com/2p8c2p8s',
      'description': 'Stylish and comfortable sports shoes.'
    },
  ];

  void addToCart(Map<String, String> product) {
    widget.cart.add(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product['name']} added to cart!')),
    );
    setState(() {}); // Refresh the UI to reflect the cart count
  }

  void logout() {
    // Handle logout logic here
    Navigator.of(context).pop(); // Navigate back to login or main screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logged out successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (widget.cart.isNotEmpty)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        '${widget.cart.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: widget.cart),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Products...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            // Product Grid
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to ProductDetailsPage
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            product: product,
                            onAddToCart: addToCart, // Pass addToCart function
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(product['imageUrl']!),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  product['price']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                ElevatedButton(
                                  onPressed: () {
                                    addToCart(product); // Add product to cart
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrangeAccent,
                                  ),
                                  child: Text('Add to Cart'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
