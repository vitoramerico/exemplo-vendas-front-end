import 'package:flutter/material.dart';

class CircularButtonWidget extends StatelessWidget {
  final bool isLoading;
  final IconData icon;
  final VoidCallback onPressed;

  const CircularButtonWidget({
    Key? key,
    this.isLoading = false,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: isLoading
          ? Padding(
              padding: const EdgeInsets.all(5),
              child: const CircularProgressIndicator(),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              child: Icon(icon, size: 20),
              onPressed: onPressed,
            ),
    );
  }
}
