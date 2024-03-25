import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/splash_screen.dart';
import '../presentation/ui/screens/teacher_screens/fac_main_bottom_nav_screen.dart';
import '../presentation/ui/screens/teacher_screens/teacher_homePage/fac_home_screen.dart';
import '../presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/teacher_add_announcement.dart';
import '../presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/teacher_my_todo.dart';
import '../presentation/ui/utility/app_colors.dart';
import 'controller_binders.dart';

class MyCampus extends StatelessWidget {
  const MyCampus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      initialBinding: GetXBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch:
            MaterialColor(AppColors.primaryColor.value, AppColors().color),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: const Color(0xFFCBD0F9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          filled: true,
          fillColor: AppColors.primaryColor,
          hintStyle: const TextStyle(
              fontSize: 16,
              color: Color(0xFF505050),
              fontWeight: FontWeight.bold),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          disabledBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
