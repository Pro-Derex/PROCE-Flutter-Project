import 'package:flutter/material.dart';
import 'pages/dashboard.dart';
import 'pages/cart.dart';
import 'pages/login.dart';
import 'pages/product_details.dart';
import 'pages/checkout.dart';
import 'pages/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProceApp',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/dashboard': (context) => DashboardPage(cart: [],),
        // We will handle the cart and checkout routes in onGenerateRoute
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/cart') {
          final cart = settings.arguments as List<Map<String, String>>;
          return MaterialPageRoute(
            builder: (context) => CartPage(cart: cart),
          );
        } else if (settings.name == '/checkout') {
          final cart = settings.arguments as List<Map<String, String>>;
          return MaterialPageRoute(
            builder: (context) => CheckoutPage(cart: cart),
          );
        }
        return null;
      },
    );
  }
}
