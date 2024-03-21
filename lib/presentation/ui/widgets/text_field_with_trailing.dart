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
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
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
        SizedBox(
          width: 84,
          child: TextFormField(
            controller: _emailTEController,
            decoration: const InputDecoration(
              enabled: false,
              hintText: '@lus.ac.bd',
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold),
              fillColor: Color(0xFFFFFFFF),
              contentPadding:
                  EdgeInsets.only(left: 4, right: 4, top: 20, bottom: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return '';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
