import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_availability_checking_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_availability_checking_screen.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../widgets/app_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 263,
              ),
              const AppLogo(),
              const SizedBox(
                height: 68,
              ),
              SizedBox(
                width: 323,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                      () => const FacAvailabilityCheckScreen(),
                    );
                  },
                  child: const Text('FACULTY MEMBER'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 323,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                      () => const StuAvailabilityCheckScreen(),
                    );
                  },
                  child: const Text('STUDENT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
