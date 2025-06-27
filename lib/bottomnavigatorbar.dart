import 'package:flutter/material.dart';
import 'main_page.dart';
import 'account_page.dart';
import 'shopbycategory.dart';
import 'cart_page.dart'; // Placeholder for the Cart Page

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  // Define a Map to hold cart items
  final Map<String, int> _cartItems = {};

  final List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    // Initialize children with proper CartPage instance
    _children.addAll([
      const MainPage(),
      const ShopByCategory(),
      CartPage(cartItems: _cartItems), // Pass the cart items map here
      const AccountPage(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/logo.png'), // Use the logo image here
              size: 24.0, // Adjust size if needed
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
