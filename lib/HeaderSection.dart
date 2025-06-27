import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16), 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), 
        boxShadow: [
          BoxShadow(
            color: Colors.black26, 
            blurRadius: 6, 
            offset: const Offset(2, 2), 
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), 
        child: Image.asset(
          'assets/banner.jpg', 
          fit: BoxFit.contain, 
          width: double.infinity, 
          height: 200, 
        ),
      ),
    );
  }
}
