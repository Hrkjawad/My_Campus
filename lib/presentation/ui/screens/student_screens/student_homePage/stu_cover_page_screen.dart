import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';

class StuCoverPageScreen extends StatefulWidget {
  const StuCoverPageScreen({super.key, required this.facName, required this.facDesignation, required this.facDepartment, required this.taskType, required this.courseCode, required this.courseTitle, required this.taskTitle});

  final String facName;
  final String facDesignation;
  final String facDepartment;
  final String taskType;
  final String taskTitle;
  final String courseCode;
  final String courseTitle;

  @override
  State<StuCoverPageScreen> createState() => _StuCoverPageScreenState();
}

class _StuCoverPageScreenState extends State<StuCoverPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cover Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                  height: 180.h,
                  child:
                      Image.asset('assets/images/Leading_University_Logo.png')),
            ),
            SizedBox(
              height: 50.h,
            ),
            Column(
              children: [
                Text(
                  '${widget.taskType.toString()} on: ${widget.taskTitle.toString()}',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Course Code: ${widget.courseCode.toString()}',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Course Title: ${widget.courseTitle.toString()}',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 50.h,
                ),
                const Text(
                  'Submitted to:',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                   widget.facName.toString(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  widget.facDesignation.toString(),
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Department of ${widget.facDepartment.toString()}',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 50.h,
                ),

                const Text(
                  'Submitted by:',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  AuthController.fullName1.toString(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  AuthController.studentId1.toString(),
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                 'Department of ${ AuthController.department1.toString()}',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
