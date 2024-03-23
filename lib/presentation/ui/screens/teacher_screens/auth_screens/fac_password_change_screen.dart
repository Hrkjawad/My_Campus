import 'package:flutter/material.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/password_text_field.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../widgets/customised_elevated_button.dart';

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
                  const TitleAndSubtitle(
                      title: 'CHANGE', subtitle: 'Set your password'),
                  const AppLogo(),
                  const SizedBox(
                    height: 76,
                  ),
                  SizedBox(
                    width: 323,
                    child: Column(
                      children: [
                        PasswordTextField(
                          emailTEController: _newPassTEController,
                          isObscure: true,
                          hintText: 'New Password',
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        PasswordTextField(
                          emailTEController: _confirmTEController,
                          isObscure: true,
                          hintText: 'Confirm Password',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomisedElevatedButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      text: 'SUBMIT'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
