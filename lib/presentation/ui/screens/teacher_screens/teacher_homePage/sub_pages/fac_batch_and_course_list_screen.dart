import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/testing_stu_course_list_screen.dart';
import 'fac_chat_screen.dart';

class FacBatchAndCourseListScreen extends StatefulWidget {
  const FacBatchAndCourseListScreen({super.key});

  @override
  State<FacBatchAndCourseListScreen> createState() =>
      _FacBatchAndCourseListScreenState();
}

class _FacBatchAndCourseListScreenState
    extends State<FacBatchAndCourseListScreen> {
  List<String> batch = ['57', '58', '59', '60'];
  List<String> courseCode = ['CSE-1111', 'CSE-1112', 'CSE-1113', 'CSE-1114'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(
                () => const TestingStuCourseListScreen(),
              );
            },
            child: const Text('Student End'),
          ),
          Padding(
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
                    itemCount: batch.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(
                            () => FacChatScreen(
                              batch: batch[index],
                              courseCode: courseCode[index], courseTitle: '',
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Text(
                            batch[index],
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
        ],
      ),
    );
  }
}
