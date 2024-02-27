import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/home_screen.dart';
import 'package:my_campus/presentation/ui/utility/image_assets.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              ImageAssets.myCampusLogoSVG,
            ),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 8,
          ),
          const Text('Version 1.0.0'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
