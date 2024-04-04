import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_signin_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_recovery_email_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_text_button.dart';
import 'package:my_campus/presentation/ui/widgets/password_text_field.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../widgets/customised_elevated_button.dart';
import '../../../widgets/text_field_with_trailing.dart';
import '../teacher_homePage/fac_home_screen.dart';

class FacSignInScreen extends StatefulWidget {
  const FacSignInScreen({super.key});

  @override
  State<FacSignInScreen> createState() => _FacSignInScreenState();
}

class _FacSignInScreenState extends State<FacSignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TitleAndSubtitle(
                    title: 'SIGN IN', subtitle: 'Faculty Member'),
                const AppLogo(),
                 SizedBox(
                  height: 76.h,
                ),
                TextFieldWithTrailing(emailTEController: _emailTEController, hintText: "Type your teacher email"'',),
                 SizedBox(
                  height: 12.h,
                ),
                PasswordTextField(
                  emailTEController: _passTEController,
                  isObscure: true,
                  hintText: 'Password',
                ),
                 SizedBox(
                  height: 30.h,
                ),
                GetBuilder<FacSignInController>(
                  builder: (facLoginController) {
                    if (facLoginController.facSignInInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    }
                    return CustomisedElevatedButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          facSignIn(facLoginController);
                        }
                        // Get.to(
                        //   () => const FacHomeScreen(),
                        // );
                      },
                      text: 'SIGN IN',
                    );
                  },
                ),
                 SizedBox(
                  height: 34.h,
                ),
                CustomisedTextButton(
                    onTap: () {
                      Get.to(
                        () => const FacRecoveryEmailScreen(),
                      );
                    },
                    text: 'Forgot Password')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> facSignIn(FacSignInController facLoginController) async {
    final result = await facLoginController.facSignIn(
      _emailTEController.text.trim(),
      /*('${_emailTEController.text.trim()}@lus.ac.bd'),*/
      _passTEController.text.trim(),
    );

    if (result) {
      Get.snackbar('Successful!', facLoginController.message);
      Get.to(
        () => const FacHomeScreen(),
      );
    } else {
      Get.snackbar('Failed!', facLoginController.message,
          colorText: Colors.redAccent);
    }
  }
}