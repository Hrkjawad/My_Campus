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
            textInputAction: TextInputAction.next,
            cursorColor: Colors.black,
            decoration:   InputDecoration(
              suffixIcon: Container(
                width: 110,
                height: 59,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(21.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(21.0),
                  ),
                  border: Border.all(
                    color: const Color(0x999B9B9B),
                  ),

                ),
                child: const Center(
                  child: Text(
                    '@lus.ac.bd',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
              ),
              hintText: 'Type your email',
              errorStyle: const TextStyle(
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