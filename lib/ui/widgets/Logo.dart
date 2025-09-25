import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  double LogoSize;
   Logo({super.key,this.LogoSize=160});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: LogoSize,
      height: LogoSize,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: Container(
              width: LogoSize*0.75,
              height: LogoSize*0.75,
              decoration: BoxDecoration(
                color: const Color(0xFFA68AFA),
                borderRadius: BorderRadius.circular(LogoSize*0.2),
              ),
              child: Icon(
                Icons.favorite_border,
                size: LogoSize*0.42,
                color: Colors.white,
              ),
            ),
          ),
        /*  Positioned(
            top: 6,
            right: 14,
            child: ImageIcon(
              AssetImage('assets/images/shines.png'),
              size: 48,
              color: const Color(0xFF7D22CC),
            ),
          ),*/
        ],
      ),
    );
  }
}