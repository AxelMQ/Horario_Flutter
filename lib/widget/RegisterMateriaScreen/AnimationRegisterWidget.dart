
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationRegisterWidget extends StatelessWidget {
  const AnimationRegisterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Lottie.asset('assets/registerForm.json'),
      ),
    );
  }
}