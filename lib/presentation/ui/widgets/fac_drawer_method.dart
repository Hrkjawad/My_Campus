import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/fac_my_todo.dart';
import 'package:my_campus/presentation/ui/widgets/faculty_members_list_method.dart';
import 'blood_downer_list.dart';
import 'cr_list_method.dart';

Drawer customisedFacultyDrawer(BuildContext context) {
  return Drawer(
    width: 286.w,
    backgroundColor: const Color(0xFFE0FFF1),
    child: Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    'Departments Faculty',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  facultyMembers(context);
                },
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    "Department's CR",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  crList(context);
                },
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    'Bus Schedule',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: 500.w,
                        height: 300.h,
                        child: AlertDialog(
                          title: Center(
                            child: Text(
                              "Bus Schedules",
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                          content: InteractiveViewer(
                            boundaryMargin:
                                EdgeInsets.all(ScreenUtil().setWidth(20)),
                            minScale: 0.1,
                            maxScale: 6.0,
                            child: Image.asset(
                              'assets/images/Bus Time.jpg',
                              height: 300.h,
                              width: 500.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              divider(),
              /*ListTile(
                title: Center(
                  child: Text(
                    'Add Tasks',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  Get.to(() => const FacAddTask());
                },
              ),
              divider(),*/
              ListTile(
                title: Center(
                  child: Text(
                    'Blood Downers',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  bloodDownerList(context);
                },
              ),
              divider(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Center(
            child: Text(
              'Version 1.0',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
          ),
        ),
      ],
    ),
  );
}

Divider divider() {
  return Divider(
    color: const Color(0xFF0D6858),
    height: 3.h,
    thickness: 1.w,
  );
}
