import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/auth_screens/stu_availability_checking_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_availability_checking_screen.dart';
import '../utility/image_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 225,
            ),
            SvgPicture.asset(
              ImageAssets.myCampusLogoSVG,
              width: 130,
              height: 117,
            ),
            const SizedBox(
              height: 58,
            ),
            SizedBox(
              width: 277,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => const TeacherAvailabilityCheckScreen(),
                  );
                },
                child: const Text('FACULTY MEMBER'),
              ),
            ),
            const SizedBox(
              height: 43,
            ),
            SizedBox(
              width: 277,
              height: 50,
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
    );
  }
}
