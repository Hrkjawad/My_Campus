import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_up_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/email_header_text_field_method.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../widgets/customised_text_button.dart';
import '../../../widgets/email_trailing_method.dart';
import 'fac_sign_in_screen.dart';

class FacAvailabilityCheckScreen extends StatefulWidget {
  const FacAvailabilityCheckScreen({super.key});

  @override
  State<FacAvailabilityCheckScreen> createState() =>
      _FacAvailabilityCheckScreenState();
}

class _FacAvailabilityCheckScreenState
    extends State<FacAvailabilityCheckScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
                  title: 'WELCOME',
                  subtitle: 'Join as a Faculty',
                ),
                const AppLogo(),
                const SizedBox(
                  height: 76,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    emailHeaderTextField(_emailTEController),
                    emailTrailing(_emailTEController),
                  ],
                ),
                const SizedBox(
                  height: 47,
                ),
                CustomisedElevatedButton(
                  onTap: () {
                    /*if (_formKey.currentState!.validate()) {
                        Get.to(
                          () => const FacSignUpScreen(),
                        );
                      }*/
                    Get.to(
                      () => const FacSignUpScreen(),
                    );
                  },
                  text: 'CHECK AVAILABILITY',
                ),
                const SizedBox(
                  height: 43,
                ),
                CustomisedTextButton(
                  onTap: () {
                    Get.to(
                      () => const FacSignInScreen(),
                    );
                  },
                  text: 'Sign In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
