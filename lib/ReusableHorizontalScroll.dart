import 'package:flutter/material.dart';

class Item {
  final String name;
  final String weight;
  final String imagePath;
  final double price;

  Item(this.name, this.weight, this.imagePath, this.price);
}

class ReusableScrollWidget extends StatelessWidget {
  final List<Item> items;
  final Function(String) addToCart;
  final Function(String) removeFromCart;
  final Map<String, int> cartItems;

  const ReusableScrollWidget({
    Key? key,
    required this.items,
    required this.addToCart,
    required this.removeFromCart,
    required this.cartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items.map((item) {
            return ItemWidget(
              item: item,
              addToCart: addToCart,
              cartItems: cartItems,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;
  final Function(String) addToCart;
  final Map<String, int> cartItems;

  const ItemWidget({
    Key? key,
    required this.item,
    required this.addToCart,
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
                  item.imagePath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(item.weight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/rupee-indian.png', height: 20),
                  Text('${item.price}'),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: GestureDetector(
            onDoubleTap: () {
              addToCart(item.name); // Add item twice on double tap
              addToCart(item.name); // Trigger the addition again for double tap
            },
            child: Row(
              children: [
                IconButton(
                  onPressed: () => addToCart(item.name),
                  icon: const Icon(Icons.add_circle, color: Colors.red, size: 24),
                ),
                if (cartItems.containsKey(item.name) && cartItems[item.name]! > 0)
                  Text('${cartItems[item.name]}', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
