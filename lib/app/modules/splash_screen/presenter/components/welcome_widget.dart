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
          'bemVindo'.tr,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                fontWeight: FontWeight.bold,
                foreground: getLinearGradientForeground(context),
              ),
        ),
      ),
    );
  }

  Paint? getLinearGradientForeground(BuildContext context) {
    var colorBase = Theme.of(context).textTheme.headline1?.color;

    if (colorBase == null) return null;

    var colors = <Color>[colorBase, colorBase.withOpacity(0.2)];

    final Shader linearGradient =
        LinearGradient(colors: colors).createShader(new Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

    return Paint()..shader = linearGradient;
  }
}
