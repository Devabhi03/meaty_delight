import 'package:flutter/material.dart';

class DiscoverSection extends StatelessWidget {
  const DiscoverSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            BannerItem(imagePath: 'assets/banner.jpg'),
            const SizedBox(width: 12),
            BannerItem(imagePath: 'assets/discover.png'),
            const SizedBox(width: 12),
            BannerItem(imagePath: 'assets/banner.jpg'),
            const SizedBox(width: 12),
            BannerItem(imagePath: 'assets/discover.png'),
          ],
        ),
      ),
    );
  }
}

class BannerItem extends StatelessWidget {
  final String imagePath;

  const BannerItem({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        width: 300, // Adjust the width as needed
        height: 200, // Adjust the height as needed
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
