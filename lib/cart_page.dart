import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final Map<String, int> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If the cart is empty, display a message
    if (cartItems.isEmpty) {
      return Scaffold(
        /*appBar: AppBar(
          title: const Text('Cart'),
        ),*/
        body: const Center(
          child: Text('Your cart is empty'),
        ),
      );
    }

    // Display cart items if the cart is not empty
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Cart'),
      ),*/
      body: ListView(
        children: cartItems.entries.map((entry) {
          final String itemName = entry.key;
          final int itemCount = entry.value;

          // Check if the cart item count is greater than zero
          if (itemCount > 0) {
            return ListTile(
              title: Text(itemName),
              subtitle: Text('Quantity: $itemCount'),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  // Implement remove functionality if required
                },
              ),
            );
          } else {
            return const SizedBox.shrink(); // Return an empty widget if count is zero or invalid
          }
        }).toList(),
      ),
    );
  }
}
