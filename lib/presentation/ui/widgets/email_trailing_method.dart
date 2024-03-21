import 'package:flutter/material.dart';

SizedBox emailTrailing(TextEditingController emailTEController) {
  return SizedBox(
    width: 84,
    child: TextFormField(
      controller: emailTEController,
      decoration: const InputDecoration(
        enabled: false,
        hintText: '@lus.ac.bd',
        hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold),
        fillColor: Color(0xFFFFFFFF),
        contentPadding: EdgeInsets.only(left: 4, right: 4, top: 20, bottom: 20),
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
  );
}
