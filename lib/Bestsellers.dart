import 'package:flutter/material.dart';
import 'MealCard.dart';

class Bestsellers extends StatelessWidget {
  final Function(String) addToCart; // Accept the addToCart function
  final Map<String, int> cartItems; // Accept cart items map

  const Bestsellers({
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
            'Bestsellers',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Most popular products near you!',
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
                  addToCart: addToCart,
                  cartItems: cartItems,
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/third_meal.jpg',
                  name: 'Chicken Leg Piece',
                  weight: '500g',
                  price: '500',
                  addToCart: addToCart,
                  cartItems: cartItems,
                ),
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
                  addToCart: addToCart,
                  cartItems: cartItems,
                ),
                const SizedBox(width: 12),
                MealCard(
                  imagePath: 'assets/third_meal.jpg',
                  name: 'Chicken Leg Piece',
                  weight: '500g',
                  price: '500',
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
