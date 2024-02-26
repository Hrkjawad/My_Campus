import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/splash_screen.dart';

import 'controller_binders.dart';

class MyCampus extends StatelessWidget {
  const MyCampus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetXBindings(),
      home: const SplashScreen(),
    );
  }
}
