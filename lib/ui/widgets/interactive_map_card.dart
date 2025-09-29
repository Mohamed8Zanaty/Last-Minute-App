import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class InteractiveMapCard extends StatelessWidget {
  final VoidCallback? onTap;
  final double height;
  final double innerBottomGap;
  final double radius;

  const InteractiveMapCard({
    this.onTap,
    this.height = 200,
    this.innerBottomGap = 20.0,
    this.radius = 12.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          elevation: 4,
          color: Colors.white,
          child: SizedBox(
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Stack(
                children: [
                  Positioned.fill(child: Container(color: Colors.transparent)),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: innerBottomGap,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: softViolet.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(radius),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.location_on, size: 40, color: purple),
                          SizedBox(height: 10),
                          Text('Interactive Map', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text('Tap to view full map with locations'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
