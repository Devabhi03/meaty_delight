class Item {
  final String name;
  final String weight;
  final String imagePath;
  final double price;
  final String deliveryTime;

  Item(this.name, this.weight, this.imagePath, this.price, this.deliveryTime);
}

// Define your items
List<Item> items = [
  Item(
    'Chicken Breast Boneless',
    '500g',
    'assets/third_meal.jpg',
    280.0,
    'Delivery by Tomorrow 6am-8am',
  ),
  Item(
    'Chicken Sausage',
    '250g',
    'assets/second_meal.jpg',
    250.0,
    'Delivery by Tomorrow 6am-8am',
  ),
  Item(
    'Chicken Leg Piece',
    '500g',
    'assets/first_meal.jpg',
    500.0,
    'Delivery by Tomorrow 6am-8am',
  ),
];
