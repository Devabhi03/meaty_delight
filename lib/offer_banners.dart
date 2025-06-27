import 'package:flutter/material.dart';

class OfferBanners extends StatelessWidget {
  const OfferBanners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Add horizontal padding
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Add your navigation logic here
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/offer.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
                height: 200, // Adjust the height as needed
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add your navigation logic here
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/offer_1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                height: 200, // Adjust the height as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
