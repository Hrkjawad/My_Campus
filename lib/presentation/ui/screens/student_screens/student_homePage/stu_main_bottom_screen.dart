import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_homePage/stu_available_course_screen.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_homePage/stu_home_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/fac_announcement.dart';

import '../../../../state_holders/faculty_state_holders/fac_announcement_controller.dart';
import '../../../../state_holders/faculty_state_holders/fac_main_bottom_controller.dart';
import '../../../../state_holders/faculty_state_holders/fac_resource_controller.dart';
import '../../../../state_holders/faculty_state_holders/fac_show_group_batch_section_course_controller.dart';
import '../../../utility/app_colors.dart';
import '../../../widgets/file_upload.dart';


class StuMainBottomNavBarScreen extends StatefulWidget {
  const StuMainBottomNavBarScreen({super.key});

  @override
  State<StuMainBottomNavBarScreen> createState() =>
      _StuMainBottomNavBarScreenState();
}

class _StuMainBottomNavBarScreenState extends State<StuMainBottomNavBarScreen> {
  final List<Widget> _screens = const [
    StuHomeScreen(),
    StuAvailableCourseScreen(),
    StuHomeScreen(),
    StuHomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // print(AuthController.accessToken1);
      // print(AuthController.fullName1);
      // print(AuthController.department1);
      // print(AuthController.batch1);
      // print(AuthController.email1);
      // return;
      // Get.find<FacAnnouncementController>().facShowAnnouncement();
      // Get.find<FacResourceController>().showResource();
      //Get.find<FacShowGroupBatchSectionCourseController>().facultyCreatingSubGrpBatchSecDataList!();
      // Get.find<CategoryController>().getCategory();
      // Get.find<PopularProductController>().getPopularProducts();
      // Get.find<SpecialProductController>().getSpecialProducts();
      // Get.find<NewProductController>().getNewProducts();
      // Get.find<ReadProfileController>().readProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacMainBottomNavController>(
        builder: (facMainBottomNavController) {
          return Scaffold(
            body: _screens[facMainBottomNavController.currentSelectedScreen],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: facMainBottomNavController.currentSelectedScreen,
                onTap: facMainBottomNavController.changeScreen,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home, color: Colors.green, size: 30.w),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.mark_unread_chat_alt_rounded,
                          color: Colors.blue, size: 30.w),
                      label: 'Courses'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.today_outlined,
                          color: Colors.brown, size: 30.w),
                      label: 'My Todo'),
                ]),
          );
        });
  }
}
