import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utility/image_assets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                'Join as a Faculty',
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
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.black,
                      decoration:
                          const InputDecoration(hintText: 'Type one time password'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(hintText: 'New password'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(hintText: 'Confirm password'),
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
                  onPressed: () {},
                  child: const Text('REGISTER'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
