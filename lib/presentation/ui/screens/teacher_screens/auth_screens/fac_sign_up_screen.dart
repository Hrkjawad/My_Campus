import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_signup_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_verify_otp_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_in_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/password_text_field.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../widgets/customised_elevated_button.dart';

class FacSignUpScreen extends StatefulWidget {
  const FacSignUpScreen({super.key, required this.email});
  final String email;

  @override
  State<FacSignUpScreen> createState() => _FacSignUpScreenState();
}

class _FacSignUpScreenState extends State<FacSignUpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
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
                      controller: _otpTEController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(hintText: 'OTP'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Please enter OTP';
                        }
                        if (value?.trim().length != 6) {
                          return 'OTP length is 6';
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
                    isObscure: true,
                    hintText: 'New Password',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  PasswordTextField(
                    emailTEController: _confirmPassTEController,
                    isObscure: true,
                    hintText: 'Confirm Password',
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  GetBuilder<FacVerifyOTPController>(
                    builder: (facVerifyOTPController) {
                      if (facVerifyOTPController.facVerifyOTPInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        );
                      }
                      return GetBuilder<FacSignUpController>(
                        builder: (facSignUpController) {
                          return CustomisedElevatedButton(
                            onTap: () async {
                              verifyOTP(
                                  facVerifyOTPController, facSignUpController);
                            },
                            text: 'SIGN UP',
                          );
                        },
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

  Future<void> verifyOTP(FacVerifyOTPController facVerifyOTPController,
      FacSignUpController facSignUpController) async {
    final result = await facVerifyOTPController.facVerifyOTP(
      widget.email,
      _otpTEController.text.trim(),
    );
    if (result) {
      Get.snackbar('Successful!', facVerifyOTPController.message);
      changePassword(facSignUpController);
    } else {
      Get.snackbar('Failed!', facVerifyOTPController.message,
          colorText: Colors.redAccent);
    }
  }

  Future<void> changePassword(
      FacSignUpController facSignUpController) async {
    final result = await facSignUpController.facSignUp(
      widget.email,
      _otpTEController.text.trim(),
      _newPassTEController.text,
    );
    if (result) {
      Get.snackbar('Successful!', facSignUpController.message);
      Get.to(
            () => const FacSignInScreen(),
      );
    } else {
      Get.snackbar('Failed!', facSignUpController.message,
          colorText: Colors.redAccent);
    }
  }
}
