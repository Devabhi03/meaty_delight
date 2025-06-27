import 'package:flutter/material.dart';

class ShopByCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop by Categories"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          CategoryTile(
            title: 'Chicken',
            imagePath: 'assets/chicken.png',
          ),
          CategoryTile(
            title: 'Mutton',
            imagePath: 'assets/mutton.png',
          ),
          CategoryTile(
            title: 'Fish & Seafood',
            imagePath: 'assets/fish_and_seafood.png',
          ),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryTile({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(imagePath, height: 100, width: 100),
          Text(title),
        ],
      ),
    );
  }
}
