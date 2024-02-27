import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utility/image_assets.dart';

class StuSignUpScreen extends StatefulWidget {
  const StuSignUpScreen({super.key});

  @override
  State<StuSignUpScreen> createState() => _StuSignUpScreenState();
}

class _StuSignUpScreenState extends State<StuSignUpScreen> {
  final TextEditingController _oneTimePassTEController =
      TextEditingController();
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _confirmPassTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 112,
                ),
                const Text(
                  'SIGN UP',
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
                  height: 66,
                ),
                SizedBox(
                  width: 277,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _oneTimePassTEController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            hintText: 'Type one time password'),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Please enter one time password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _newPassTEController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        cursorColor: Colors.black,
                        decoration:
                            const InputDecoration(hintText: 'New password'),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter new password';
                          }
                          if (value!.length < 6) {
                            return 'Password length must be more than 6';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _confirmPassTEController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        cursorColor: Colors.black,
                        decoration:
                            const InputDecoration(hintText: 'Confirm password'),
                        validator: (String? value) {
                          if (value != _newPassTEController.text) {
                            return "Password didn't match";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                SizedBox(
                  width: 277,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text('REGISTER'),
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
