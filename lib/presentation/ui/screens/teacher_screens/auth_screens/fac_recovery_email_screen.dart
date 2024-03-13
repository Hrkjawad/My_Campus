import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_password_change_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';

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
                const SizedBox(
                  height: 131,
                ),
                const Text(
                  'RECOVERY',
                  style: TextStyle(
                    fontSize: 47,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const Text(
                  'A code will be send to your mail',
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
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 323,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      Get.to(
                        () => const FacPasswordChangeScreen(),
                      );
                    },
                    child: const Text('SUBMIT'),
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
