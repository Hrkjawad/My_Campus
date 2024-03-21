import 'package:flutter/material.dart';

SizedBox emailHeaderTextField(TextEditingController emailTEController) {
  return SizedBox(
    width: 239,
    child: TextFormField(
      controller: emailTEController,
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
  );
}
