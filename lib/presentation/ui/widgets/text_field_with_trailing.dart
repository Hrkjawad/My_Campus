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
          width: 323,
          child: TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            cursorColor: Colors.black,
            decoration:  const InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  '@lus.ac.bd',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              hintText: 'Type your email',
              errorStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),

            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}