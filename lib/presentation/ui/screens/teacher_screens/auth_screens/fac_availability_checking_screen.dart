import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_login_controller.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/title_and_subtitle.dart';
import '../../../widgets/customised_text_button.dart';
import '../../../widgets/text_field_with_trailing.dart';
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
                TextFieldWithTrailing(emailTEController: _emailTEController),
                const SizedBox(
                  height: 47,
                ),
                GetBuilder<FacLoginController>(
                  builder: (facLoginController) {
                    if (facLoginController.facLoginInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return CustomisedElevatedButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          final result = await facLoginController.facLogin(
                            ('${_emailTEController.text.trim()}@lus.ac.bd'),
                          );
                          if (result) {
                            Get.snackbar(
                                'Successful!', facLoginController.message);
                            _emailTEController.clear();
                          } else {
                            Get.snackbar('Failed!', facLoginController.message,
                                colorText: Colors.redAccent);
                          }
                        }
                      },
                      text: 'CHECK AVAILABILITY',
                    );
                  },
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
