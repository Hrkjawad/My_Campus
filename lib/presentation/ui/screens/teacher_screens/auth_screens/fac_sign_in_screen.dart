import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_recovery_email_screen.dart';
import '../../../utility/image_assets.dart';

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
                'SIGN IN',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const Text(
                'Faculty Member',
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
                      textInputAction: TextInputAction.next,
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
                height: 10,
              ),
              SizedBox(
                width: 277,
                child: TextFormField(
                  controller: _passTEController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(hintText: 'Enter password'),
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
                height: 35,
              ),
              SizedBox(
                width: 277,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text('LOGIN'),
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              TextButton(
                onPressed: () {
                  Get.to(
                    () => const FacRecoveryEmailScreen(),
                  );
                },
                child: const Text(
                  'Forgot Password',
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
