import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeWidget extends StatelessWidget {
  final bool startAnimation;
  final Duration animationDuration;

  const WelcomeWidget({
    Key? key,
    required this.startAnimation,
    required this.animationDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedOpacity(
        duration: animationDuration,
        opacity: startAnimation ? 1.0 : 0.0,
        child: Text(
          'Bem vindo!',
          style: Get.textTheme?.headline3,
        ),
      ),
    );
  }
}
