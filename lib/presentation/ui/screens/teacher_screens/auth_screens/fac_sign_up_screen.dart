import 'package:flutter/material.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';

class FacSignUpScreen extends StatefulWidget {
  const FacSignUpScreen({super.key});

  @override
  State<FacSignUpScreen> createState() => _FacSignUpScreenState();
}

class _FacSignUpScreenState extends State<FacSignUpScreen> {
  final TextEditingController _oneTimePassTEController = TextEditingController();
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _confirmPassTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 131,
                  ),
                  const Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 47,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const Text(
                    'Join as a Faculty',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF585858),
                    ),
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  const AppLogo(),
                  const SizedBox(
                    height: 77,
                  ),
                  SizedBox(
                    width: 323,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _oneTimePassTEController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              hintText: 'Type one time password'),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Please enter one time password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: _newPassTEController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          cursorColor: Colors.black,
                          decoration:
                              const InputDecoration(hintText: 'New password'),
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter new password';
                            }
                            if (value!.length < 6) {
                              return 'Password length must be more than 6';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: _confirmPassTEController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: Colors.black,
                          decoration:
                              const InputDecoration(hintText: 'Confirm password'),
                          validator: (String? value) {
                            if (value != _newPassTEController.text) {
                              return "Password didn't match";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  SizedBox(
                    width: 323,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
