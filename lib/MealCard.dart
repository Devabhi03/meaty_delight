import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String weight;
  final String price;
  final Function(String) addToCart;
  final Map<String, int> cartItems;

  const MealCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.weight,
    required this.price,
    required this.addToCart,
    required this.cartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => addToCart(name), // Add to cart on image tap
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(weight),
    const SizedBox(width: 12),
    Row(
      children: [
        Image.asset('assets/rupee-indian.png', height: 18), // Adjust height as needed
        const SizedBox(width: 4),
        Text(
          price,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  ],
),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/home-delivery.png', height: 20),
              const SizedBox(width: 4),
              const Flexible(
                child: Text('Tomorrow 8am', textAlign: TextAlign.center),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

