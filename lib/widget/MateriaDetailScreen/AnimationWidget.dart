
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationWidget extends StatelessWidget {
  const AnimationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 150),
      child: ClipRRect(
        child: Lottie.asset('assets/information.json'),
      ),
    );
  }
}
