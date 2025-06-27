import 'package:flutter/material.dart';

class ShopByCategory extends StatelessWidget {
  const ShopByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shop by Category',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Fresh meats and much more?',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 1,
            children: [
              _buildCategoryItem('assets/chicken.png', 'Chicken'),
              _buildCategoryItem('assets/mutton.png', 'Mutton'),
              _buildCategoryItem(
                  'assets/fish and seafood.png', 'Fish & Seafood'),
              _buildCategoryItem('assets/mutton.png', 'Mutton'),
              _buildCategoryItem(
                  'assets/fish and seafood.png', 'Fish & Seafood'),
              _buildCategoryItem('assets/chicken.png', 'Chicken'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String imagePath, String label) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
