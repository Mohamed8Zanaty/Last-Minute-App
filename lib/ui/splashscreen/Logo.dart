import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFA68AFA),
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Icon(
                Icons.favorite_border,
                size: 68,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 6,
            right: 14,
            child: ImageIcon(
              AssetImage('assets/images/shines.png'),
              size: 48,
              color: const Color(0xFF7D22CC),
            ),
          ),
        ],
      ),
    );
  }
}