import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_recovery_email_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_main_bottom_nav_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_text_button.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../widgets/customised_elevated_button.dart';
import '../../../widgets/text_field_with_trailing.dart';

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
                const SizedBox(
                  height: 76,
                ),
                TextFieldWithTrailing(emailTEController: _emailTEController),

                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  width: 323,
                  child: TextFormField(
                    controller: _passTEController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration:
                        const InputDecoration(hintText: 'Enter password'),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your password';
                      }
                      if (value!.length < 6) {
                        return 'Password length must be more than 6';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 41,
                ),
                CustomisedElevatedButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                    Get.to(
                      () => const FacMainBottomNavScreen(),
                    );
                  },
                  text: 'LOGIN',
                ),
                const SizedBox(
                  height: 34,
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
}
