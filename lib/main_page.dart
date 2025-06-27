import 'package:flutter/material.dart';
import 'package:meaty_delight/Bestsellers.dart';
import 'package:meaty_delight/FreshSeaFood.dart';
import 'package:meaty_delight/HeaderSection.dart';
import 'package:meaty_delight/ReadyToCook.dart';
import 'package:meaty_delight/ShopByCategory.dart';
import 'package:meaty_delight/ShopbyCategorypage.dart';
import 'package:meaty_delight/discover_section.dart'; // Import DiscoverSection
import 'package:meaty_delight/cart_page.dart'; // Placeholder for Cart Page
import 'package:meaty_delight/account_page.dart'; // Placeholder for Account Page
import 'package:meaty_delight/offer_banners.dart';
import 'Customappbar.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeatyDelight',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // Define a Map to hold cart items
  final Map<String, int> _cartItems = {};

  // List of Pages for the Bottom Navigation Bar
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    // Initialize pages with proper instances
    _pages.addAll([
      const HomePage(), // Custom HomePage that includes HeaderSection, ShopByCategory, Bestsellers, and ReadyToCook
      const ShopByCategoryPage(), // Categories page
      const CartPage(cartItems: {}), // Initialize with an empty Map
      const AccountPage(), // Account page for user details and history
    ]);
  }

  // Method to add items to the cart
  void _addToCart(String itemName) {
    setState(() {
      _cartItems[itemName] = (_cartItems[itemName] ?? 0) + 1;
    });
  }

  // Method to remove items from the cart
  void _removeFromCart(String itemName) {
    setState(() {
      if (_cartItems.containsKey(itemName) && _cartItems[itemName]! > 0) {
        _cartItems[itemName] = _cartItems[itemName]! - 1;
        if (_cartItems[itemName] == 0) {
          _cartItems.remove(itemName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Meathy Delight',), // Custom AppBar remains
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            // Update the cart page instance when navigating to it
            if (index == 2) {
              _pages[2] = CartPage(cartItems: _cartItems); // Update CartPage with current cart items
            }
            _currentIndex = index; // Switch pages based on selected item
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

// Custom HomePage with HeaderSection, ShopByCategory, Bestsellers, DiscoverSection, and ReadyToCook
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the MainPage state to get cartItems and functions
    final mainPageState = context.findAncestorStateOfType<_MainPageState>();

    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderSection(),
          const ShopByCategory(),
          Bestsellers(
            addToCart: (String itemName) {
              mainPageState?._addToCart(itemName); // Ensure that the function is called correctly
            },
            cartItems: mainPageState?._cartItems ?? {}, // Pass the cart items map
          ),
          const DiscoverSection(),
          FreshSeafood(
            addToCart: (String itemName) {
              mainPageState?._addToCart(itemName);
            },
            cartItems: mainPageState?._cartItems ?? {},
          ),
          ReadyToCook(
            addToCart: (String itemName) {
              mainPageState?._addToCart(itemName);
            },
            cartItems: mainPageState?._cartItems ?? {},
          ),
          const OfferBanners(),
        ],
      ),
    );
  }
}
