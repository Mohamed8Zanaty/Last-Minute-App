import 'package:flutter/material.dart';

const Color purple600 = Color(0xFF9B6BFF);
const Color mutedText = Color(0xFF8A86A9);

class AiTopBar extends StatelessWidget {
  const AiTopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          icon: const Icon(Icons.arrow_back, color: purple600),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Ai Health Check',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: purple600,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Tell us about your symptoms',
              style: TextStyle(fontSize: 12, color: mutedText),
            ),
          ],
        ),
      ],
    );
  }
}
