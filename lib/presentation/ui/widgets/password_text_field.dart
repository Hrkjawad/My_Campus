import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    super.key,
    required TextEditingController emailTEController,
    required this.isObscure, required this.hintText,
  }) : _passwordTEController = emailTEController;

  final TextEditingController _passwordTEController;
  final String hintText;
  bool isObscure;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 323,
      child: TextFormField(
        controller: widget._passwordTEController,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: widget.isObscure,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
            onPressed: () {
              widget.isObscure = !widget.isObscure;
              setState(() {});
            },
            icon: Icon(widget.isObscure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
          ),
        ),
        validator: (String? value) {
          if (value != widget._passwordTEController.text) {
            return "Password didn't match";
          }
          return null;
        },
      ),
    );
  }
}
