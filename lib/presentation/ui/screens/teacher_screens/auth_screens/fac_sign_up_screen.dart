import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_signup_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_in_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/password_text_field.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../widgets/customised_elevated_button.dart';

class FacSignUpScreen extends StatefulWidget {
  const FacSignUpScreen({super.key});

  @override
  State<FacSignUpScreen> createState() => _FacSignUpScreenState();
}

class _FacSignUpScreenState extends State<FacSignUpScreen> {
  final TextEditingController _oneTimePassTEController =
      TextEditingController();
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _confirmPassTEController =
      TextEditingController();
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
                  const TitleAndSubtitle(
                      title: 'SIGN UP', subtitle: 'Join as a Faculty'),
                  const AppLogo(),
                  const SizedBox(
                    height: 77,
                  ),
                  SizedBox(
                    width: 323,
                    child: TextFormField(
                      controller: _oneTimePassTEController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.black,
                      decoration:
                          const InputDecoration(hintText: 'One time password'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Please enter one time password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  PasswordTextField(
                    emailTEController: _newPassTEController,
                    isObscure: true, hintText: 'New Password',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  PasswordTextField(
                    emailTEController: _confirmPassTEController,
                    isObscure: true, hintText: 'Confirm Password',
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  GetBuilder<FacSignupController>(
                    builder: (facSignupController) {
                      if (facSignupController.facSignupInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        );
                      }
                      return CustomisedElevatedButton(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final result = await facSignupController.facSignup(
                              _newPassTEController.text.trim(),
                            );
                            if (result) {
                              Get.snackbar(
                                  'Successful!', facSignupController.message);
                              Get.to(
                                () => const FacSignInScreen(),
                              );
                            } else {
                              Get.snackbar(
                                  'Failed!', facSignupController.message,
                                  colorText: Colors.redAccent);
                            }
                          }
                        },
                        text: 'SIGN UP',
                      );
                    },
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
