import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/testing_stu_chat_screen.dart';

class TestingStuCourseListScreen extends StatefulWidget {
  const TestingStuCourseListScreen({super.key});

  @override
  State<TestingStuCourseListScreen> createState() =>
      _TestingStuCourseListScreenState();
}

class _TestingStuCourseListScreenState
    extends State<TestingStuCourseListScreen> {
  List<String> courseCode = ['CSE-1111', 'CSE-1112', 'CSE-1113', 'CSE-1114'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(3.0.w),
        child: Stack(
          children: [
            Container(
              width: 380.w,
              height: 380.h,
              decoration: const BoxDecoration(
                color: Color(0xFFF8FFAC),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ListView.separated(
                itemCount: courseCode.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => TestStuChatScreen(
                          id: '57',
                          courseCode: courseCode[index],
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Text(
                        '57',
                        style: TextStyle(
                          color: const Color(0xFF0D6858),
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                      title: Text(
                        courseCode[index],
                        style: TextStyle(
                          color: const Color(0xFF0D6858),
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
