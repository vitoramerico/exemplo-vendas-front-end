import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const CustomButtonWidget({
    Key? key,
    required this.text,
    this.icon,
    this.width = double.infinity,
    this.height = 25,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: _buildButton(),
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildButton() => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Visibility(
            visible: icon != null,
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(icon),
            ),
          ),
          Visibility(
            visible: text.isNotEmpty,
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      );
}
