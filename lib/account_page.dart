import 'package:flutter/material.dart';
import 'package:meaty_delight/firstpage.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Account"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()), // Navigate back to MainPage
            );
          },
        ),
      ),*/
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Hi, Amit Kumar',
                    style: TextStyle(fontSize: 18,color: Colors.red),
                  ),
                  Text(
                    '9818886396 | Amit199016@gmail.com',
                    style: TextStyle(fontSize: 18,color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
  onTap: () {
    // Add your navigation logic here
  },
  child: Padding(
    padding: const EdgeInsets.all(10), // Adjust the padding as needed
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/offer.jpg',
        fit: BoxFit.cover,
      ),
    ),
  ),
),// Offer banner (full size)
          
          // List of clickable buttons
          _buildAccountOption(
            context, 
            'Fresh Cash', 
            'assets/rupee-indian.png', 
            () {
              // Add future functionality for Fresh Cash here
            }
          ),
          _buildAccountOption(
            context, 
            'Store Credit', 
            'assets/credit-card.png', 
            () {
              // Add future functionality for Store Credit here
            }
          ),
          _buildAccountOption(
            context, 
            'Contact Us', 
            'assets/phone-call.png', 
            () {
              // Add future functionality for Contact Us here
            }
          ),
          _buildAccountOption(
            context, 
            'FAQs', 
            'assets/faq.png', 
            () {
              // Add future functionality for FAQs here
            }
          ),
          
          // Logout Button
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FirstPage()), // Navigate to FirstPage (Login)
              );
            },
          ),
        ],
      ),
    );
  }

  // Reusable function to build each clickable option
  Widget _buildAccountOption(BuildContext context, String title, String iconPath, VoidCallback onPressed) {
    return ListTile(
      leading: Image.asset(iconPath, height: 30, width: 30), // Reduced image size
      title: Text(title),
      onTap: onPressed, // Clickable button
    );
  }
}
