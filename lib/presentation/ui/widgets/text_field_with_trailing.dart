import 'package:flutter/material.dart';

class TextFieldWithTrailing extends StatelessWidget {
  const TextFieldWithTrailing({
    super.key,
    required TextEditingController emailTEController,
  }) : _emailTEController = emailTEController;

  final TextEditingController _emailTEController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 239,
          child: TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              hintText: 'Type your email',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        const SizedBox(
          width: 84,
          child: Text(
            '@lus.ac.bd',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        )
      ],
    );
  }
}
