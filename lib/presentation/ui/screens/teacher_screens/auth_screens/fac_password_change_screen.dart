import 'package:flutter/material.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';

class FacPasswordChangeScreen extends StatefulWidget {
  const FacPasswordChangeScreen({super.key});

  @override
  State<FacPasswordChangeScreen> createState() =>
      _FacPasswordChangeScreenState();
}

class _FacPasswordChangeScreenState extends State<FacPasswordChangeScreen> {
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _confirmTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 131,
                  ),
                  const Text(
                    'CHANGE',
                    style: TextStyle(
                      fontSize: 47,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const Text(
                    'Set your password',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF585858),
                    ),
                  ),
                  const SizedBox(
                    height: 53,
                  ),
                  const AppLogo(),
                  const SizedBox(
                    height: 76,
                  ),
                  SizedBox(
                    width: 323,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _newPassTEController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
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
                          height: 13,
                        ),
                        TextFormField(
                          controller: _confirmTEController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: 'Confirm password'),
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
                    height: 40,
                  ),
                  SizedBox(
                    width: 323,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text('SUBMIT'),
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
