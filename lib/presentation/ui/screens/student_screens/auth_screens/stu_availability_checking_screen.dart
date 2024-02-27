import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_sign_in_screen.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_sign_up_screen.dart';
import 'package:my_campus/presentation/ui/utility/image_assets.dart';

class StuAvailabilityCheckScreen extends StatefulWidget {
  const StuAvailabilityCheckScreen({super.key});

  @override
  State<StuAvailabilityCheckScreen> createState() =>
      _StuAvailabilityCheckScreenState();
}

class _StuAvailabilityCheckScreenState
    extends State<StuAvailabilityCheckScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 112,
              ),
              const Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const Text(
                'Join as a Student',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF585858),
                ),
              ),
              const SizedBox(
                height: 46,
              ),
              SvgPicture.asset(
                ImageAssets.myCampusLogoSVG,
                width: 130,
                height: 117,
              ),
              const SizedBox(
                height: 65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 205,
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
                    width: 72,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabled: false,
                        hintText: '@lus.ac.bd',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w700),
                        fillColor: Color(0xFFFFFFFF),
                        contentPadding: EdgeInsets.only(left: 4),
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
                height: 40,
              ),
              SizedBox(
                width: 277,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}

                    Get.to(
                      () => const StuSignUpScreen(),
                    );
                  },
                  child: const Text('CHECK AVAILABILITY'),
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              TextButton(
                onPressed: () {
                  Get.to(
                    () => const StuSignInScreen(),
                  );
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF505050),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
