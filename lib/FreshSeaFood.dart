import 'package:flutter/material.dart';
import 'MealCard.dart';

class FreshSeafood extends StatelessWidget {
  final Function(String) addToCart; // Accept the addToCart function
  final Map<String, int> cartItems; // Accept cart items map

  const FreshSeafood({
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
            'Fresh Seafood',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Fresh seafood products available!',
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
                  imagePath: 'assets/268a18136585537.61fc0279b8891.jpg', // Fresh Salmon Fillet
                  name: 'Fresh Salmon Fillet',
                  weight: '500g',
                  price: '600',
                  addToCart: addToCart, // Pass the addToCart function
                  cartItems: cartItems, // Pass the cart items
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/second_meal.jpg', // Shrimp (Prawns)
                  name: 'Shrimp (Prawns)',
                  weight: '300g',
                  price: '400',
                  addToCart: addToCart,
                  cartItems: cartItems,
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/first_meal.jpg', // Lobster Tail
                  name: 'Lobster Tail',
                  weight: '300g',
                  price: '800',
                  addToCart: addToCart,
                  cartItems: cartItems,
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/268a18136585537.61fc0279b8891.jpg', // Fresh Salmon Fillet
                  name: 'Fresh Salmon Fillet',
                  weight: '500g',
                  price: '600',
                  addToCart: addToCart,
                  cartItems: cartItems,
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/second_meal.jpg', // Shrimp (Prawns)
                  name: 'Shrimp (Prawns)',
                  weight: '300g',
                  price: '400',
                  addToCart: addToCart,
                  cartItems: cartItems,
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/first_meal.jpg', // Lobster Tail
                  name: 'Lobster Tail',
                  weight: '300g',
                  price: '800',
                  addToCart: addToCart,
                  cartItems: cartItems,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
