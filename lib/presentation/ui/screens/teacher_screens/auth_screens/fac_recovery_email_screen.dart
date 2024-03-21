import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_password_change_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/email_header_text_field_method.dart';
import 'package:my_campus/presentation/ui/widgets/email_trailing_method.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../widgets/customised_elevated_button.dart';

class FacRecoveryEmailScreen extends StatefulWidget {
  const FacRecoveryEmailScreen({super.key});

  @override
  State<FacRecoveryEmailScreen> createState() => _FacRecoveryEmailScreenState();
}

class _FacRecoveryEmailScreenState extends State<FacRecoveryEmailScreen> {
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
                    title: 'RECOVERY',
                    subtitle: 'A code will be send to your email'),
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
                  height: 40,
                ),
                CustomisedElevatedButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                    Get.to(
                      () => const FacPasswordChangeScreen(),
                    );
                  },
                  text: 'SUBMIT',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
