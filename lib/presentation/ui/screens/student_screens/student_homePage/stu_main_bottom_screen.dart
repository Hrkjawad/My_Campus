import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/batch_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_main_bottom_controller.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_homePage/stu_available_course_screen.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_homePage/stu_home_screen.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_homePage/stu_my_todo.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_homePage/stu_resources_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/fac_announcement.dart';

import '../../../../state_holders/faculty_state_holders/fac_announcement_controller.dart';
import '../../../../state_holders/faculty_state_holders/fac_main_bottom_controller.dart';
import '../../../../state_holders/faculty_state_holders/fac_resource_controller.dart';
import '../../../../state_holders/faculty_state_holders/fac_show_group_batch_section_course_controller.dart';
import '../../../utility/app_colors.dart';
import '../../../widgets/file_upload.dart';
import '../../../widgets/sheet_connect_api.dart';

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
    StuResourcesScreen(),
    StuMyTodoScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Assignment');
      // Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Tutorial');
      // Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Viva');
      // Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Lab Report');
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
    return GetBuilder<StuMainBottomNavController>(
        builder: (stuMainBottomNavController) {
      return Scaffold(
        body: _screens[stuMainBottomNavController.currentSelectedScreen],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: stuMainBottomNavController.currentSelectedScreen,
            onTap: stuMainBottomNavController.changeScreen,
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
                  icon: Icon(Icons.assignment,
                      color: Colors.redAccent, size: 30.w),
                  label: 'Resources'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.today_outlined,
                      color: Colors.brown, size: 30.w),
                  label: 'My Todo'),

            ]),
      );
    });
  }
}
