import 'package:flutter/material.dart';

class CustomisedElevatedButton extends StatelessWidget {
  const CustomisedElevatedButton(
      {super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 323,
      height: 58,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
