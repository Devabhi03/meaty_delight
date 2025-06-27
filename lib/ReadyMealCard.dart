import 'package:flutter/material.dart';

class ReadyMealCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String weight;
  final String price;
  final Function(String) addToCart;
  final Function(String) removeFromCart;
  final Map<String, int> cartItems;

  const ReadyMealCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.weight,
    required this.price,
    required this.addToCart,
    required this.removeFromCart,
    required this.cartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 130,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Text(weight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/rupee-indian.png', height: 20),
                  Text(price),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/home-delivery.png', height: 20),
                  const Flexible(child: Text(' Tomorrow 6am - 8am')),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Row(
            children: [
              IconButton(
                onPressed: () => addToCart(title),
                icon: const Icon(Icons.add_circle, color: Colors.red, size: 24),
              ),
              // Display the quantity if greater than 0
              if (cartItems.containsKey(title) && cartItems[title]! > 0)
                Text('${cartItems[title]}', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }
}
