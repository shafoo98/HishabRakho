import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(52, 144, 220, 1.0),
      child: Center(
        child: Lottie.asset(
          'animation_assets/25227-accountant.json',
        ),
      ),
    );
  }
}
