import 'package:flutter/material.dart';

class CustomisedTextButton extends StatelessWidget {
  const CustomisedTextButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF505050),
        ),
      ),
    );
  }
}
