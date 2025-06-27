import 'package:flutter/material.dart';
import 'MealCard.dart'; // Ensure to import your MealCard file

class ReadyToCook extends StatelessWidget {
  final Function(String) addToCart; // Accept the addToCart function from parent
  final Map<String, int> cartItems; // Accept cart items map

  const ReadyToCook({
    Key? key,
    required this.addToCart,
    required this.cartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Ready to Cook',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Convenient meal options that are ready for cooking!',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MealCard(
                  imagePath: 'assets/first_meal.jpg',
                  name: 'Chicken Breast',
                  weight: '500g',
                  price: '280',
                  addToCart: addToCart, // Pass the addToCart function
                  cartItems: cartItems, // Pass the cart items
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/second_meal.jpg',
                  name: 'Chicken Sausages',
                  weight: '250g',
                  price: '250',
                  addToCart: addToCart, // Pass the addToCart function
                  cartItems: cartItems, // Pass the cart items
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/third_meal.jpg',
                  name: 'Chicken Leg Piece',
                  weight: '500g',
                  price: '500',
                  addToCart: addToCart, // Pass the addToCart function
                  cartItems: cartItems, // Pass the cart items
                ),
                const SizedBox(width: 12),
                // Add more meal cards if needed
                MealCard(
                  imagePath: 'assets/first_meal.jpg',
                  name: 'Chicken Breast',
                  weight: '500g',
                  price: '280',
                  addToCart: addToCart, // Pass the addToCart function
                  cartItems: cartItems, // Pass the cart items
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/second_meal.jpg',
                  name: 'Chicken Sausages',
                  weight: '250g',
                  price: '250',
                  addToCart: addToCart, // Pass the addToCart function
                  cartItems: cartItems, // Pass the cart items
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/third_meal.jpg',
                  name: 'Chicken Leg Piece',
                  weight: '500g',
                  price: '500',
                  addToCart: addToCart, // Pass the addToCart function
                  cartItems: cartItems, // Pass the cart items
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
