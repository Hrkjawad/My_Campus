import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_up_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
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
                const SizedBox(
                  height: 131,
                ),
                const Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 47,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const Text(
                  'Join as a Faculty',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 239,
                      child: TextFormField(
                        controller: _emailTEController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: 'Type your email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 84,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          enabled: false,
                          hintText: '@lus.ac.bd',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold),
                          fillColor: Color(0xFFFFFFFF),
                          contentPadding: EdgeInsets.only(
                              left: 4, right: 4, top: 20, bottom: 20),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 47,
                ),
                SizedBox(
                  width: 323,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      /*if (_formKey.currentState!.validate()) {
                        Get.to(
                          () => const SignUpScreen(),
                        );
                      }*/
                      Get.to(
                        () => const FacSignUpScreen(),
                      );
                    },
                    child: const Text('CHECK AVAILABILITY'),
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(
                      () => const FacSignInScreen(),
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF505050),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
