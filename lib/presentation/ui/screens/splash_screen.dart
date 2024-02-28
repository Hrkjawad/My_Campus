import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/home_screen.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import '../utility/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToNextScreen();
    super.initState();
  }

  void goToNextScreen() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Get.offAll(
        () => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SvgPicture.asset(
            ImageAssets.splashScreenBackgroundSVG,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Center(
              child: AppLogo(),
            ),
            const Spacer(),
            CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Version 1.0.0'),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ]),
    );
  }
}
