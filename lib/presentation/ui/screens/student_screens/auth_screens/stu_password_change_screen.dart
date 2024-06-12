import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_in_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/password_text_field.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../../state_holders/student_state_holders/auth_state_holders/stu_password_change_controller.dart';
import '../../../../state_holders/student_state_holders/auth_state_holders/stu_verify_otp_controller.dart';
import '../../../widgets/customised_elevated_button.dart';

class StuPasswordChangeScreen extends StatefulWidget {
  const StuPasswordChangeScreen({super.key, required this.email});

  final String email;
  @override
  State<StuPasswordChangeScreen> createState() =>
      _StuPasswordChangeScreenState();
}

class _StuPasswordChangeScreenState extends State<StuPasswordChangeScreen> {
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _confirmTEController = TextEditingController();
  final TextEditingController _otpTEController = TextEditingController();
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
                  SizedBox(
                    height: 76.h,
                  ),
                  SizedBox(
                    width: 323.w,
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
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  PasswordTextField(
                    emailTEController: _newPassTEController,
                    isObscure: true,
                    hintText: 'New Password',
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  PasswordTextField(
                    emailTEController: _confirmTEController,
                    isObscure: true,
                    hintText: 'Confirm Password',
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  GetBuilder<StuVerifyOTPController>(
                    builder: (stuVerifyOTPController) {
                      if (stuVerifyOTPController.stuVerifyOTPInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        );
                      }
                      return GetBuilder<StuPasswordChangeController>(
                        builder: (stuPasswordChangeController) {
                          return CustomisedElevatedButton(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  verifyOTP(stuVerifyOTPController,
                                      stuPasswordChangeController);
                                }
                              },
                              text: 'SUBMIT');
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

  Future<void> verifyOTP(StuVerifyOTPController stuVerifyOTPController,
      StuPasswordChangeController stuPasswordChangeController) async {
    final result = await stuVerifyOTPController.stuVerifyOTP(
      widget.email,
      _otpTEController.text.trim(),
    );
    if (result) {
      Get.snackbar('Successful!', stuVerifyOTPController.message);
      changePassword(stuPasswordChangeController);
    } else {
      Get.snackbar('Failed!', stuVerifyOTPController.message,
          colorText: Colors.redAccent);
    }
  }

  Future<void> changePassword(
      StuPasswordChangeController stuPasswordChangeController) async {
    final result = await stuPasswordChangeController.stuPasswordChange(
      widget.email,
      _otpTEController.text.trim(),
      _newPassTEController.text,
    );
    if (result) {
      Get.snackbar('Successful!', stuPasswordChangeController.message);
      Get.to(
            () => const FacSignInScreen(),
      );
    } else {
      Get.snackbar('Failed!', stuPasswordChangeController.message,
          colorText: Colors.redAccent);
    }
  }
}
