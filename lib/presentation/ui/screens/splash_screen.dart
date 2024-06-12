import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/home_screen.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_sign_in_screen.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_sign_up_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_in_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_up_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/fac_main_bottom_screen.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../state_holders/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserAuthState();
  }

  void checkUserAuthState() async {
    if (AuthController.countt == '1') {
      final result = await AuthController.checkLoginState();
      Future.delayed(const Duration(seconds: 2)).then((value) async {
        if (result && AuthController.countt == '1') {
          Get.offAll(const FacMainBottomNavBarScreen());
        } else {
          Get.offAll(const FacSignInScreen());
        }
      });
    } else if (AuthController.count1 == '0') {
      final result2 = await AuthController.checkStudentLoginState();
      Future.delayed(const Duration(seconds: 2)).then((value) async {
        if (result2 && AuthController.count1 == '0') {
          Get.offAll(const StuSignUpScreen(email: ''));
        } else {
          Get.offAll(const StuSignInScreen());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScreenBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: AppLogo(),
            ),
            Spacer(),
            CircularProgressIndicator(
              color: Colors.teal,
            ),
            SizedBox(
              height: 8,
            ),
            Text('Version 1.0.0'),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
