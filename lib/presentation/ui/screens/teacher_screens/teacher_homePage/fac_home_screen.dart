import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/widgets/fac_main_bottom_nav_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/teacher_add_announcement.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../widgets/appbar_method.dart';
import '../../../widgets/date.dart';
import '../../../widgets/dropdown_button.dart';
import '../../../widgets/fac_drawer_method.dart';
import '../../../widgets/homepage_card_elevated_button.dart';

class FacHomeScreen extends StatefulWidget {
  const FacHomeScreen({super.key});

  @override
  State<FacHomeScreen> createState() => _FacHomeScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _FacHomeScreenState extends State<FacHomeScreen> {
  List<Map<String, String>> tableData = [];
  String? selectedBatch, selectedCourse;

  //api table data fetch
  String? classAndTime = "Room: 302, RAB - 10.30 AM";
  String? classes = "4";
  String? exams = "1";
  String? myTodo = "3";

  final List<String> announcements = [
    '57-A+B | Next Sunday is Viva ',
    '56-A | Next Sunday is Tutorial ',
    '60-E | Next Sunday Class is Canceled ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, 'Teacher mail'),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  alignment: Alignment(
                    ScreenUtil().setWidth(0),
                    ScreenUtil().setHeight(0),
                  ),
                  children: [
                    SizedBox(
                      width: 355.w,
                      height: 150.h,
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(ScreenUtil().setWidth(0)),
                            bottomRight: Radius.circular(ScreenUtil().setWidth(0)),
                            topLeft: Radius.circular(ScreenUtil().setWidth(40)),
                            topRight: Radius.circular(ScreenUtil().setWidth(40)),
                          ),
                          side:  BorderSide(color: const Color(0x999B9B9B), width: 1.w),
                        ),
                        color: const Color(0xFFCBD0F9),
                      ),
                    ),
                    Positioned(
                      top: 10.h, // Adjust top position as needed
                      child: Text(
                        "Today's Schedule",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              width: 80.w,
                              height: 80.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    classes!,
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Classes",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 26.w,
                          ),
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              width: 80.w,
                              height: 80.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    exams!,
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Exams",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 26.w,
                          ),
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              width: 80.w,
                              height: 80.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    myTodo!,
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "My ToDo",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 355.w,
                  height: 45.h,
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(ScreenUtil().setWidth(40)),
                        bottomRight: Radius.circular(ScreenUtil().setWidth(40)),
                        topLeft: Radius.circular(ScreenUtil().setWidth(0)),
                        topRight: Radius.circular(ScreenUtil().setWidth(0)),
                      ),
                      side: BorderSide(color: const Color(0x999B9B9B), width: 1.w),
                    ),
                    color: Colors.white,
                    child: Center(
                        child: Text(
                          classAndTime!,
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w900,
                              color: const Color(0xFF393939)),
                        )),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Date(),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardElevatedButton(
                      width: 142.w,
                      height: 102.h,
                      text: '    My\nClasses',
                      color: 0xFFACFFDC,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 71.w,
                    ),
                    CardElevatedButton(
                      width: 142.w,
                      height: 102.h,
                      text: '  Exam\nRoutine',
                      color: 0xFFFFE8D2,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 300.h,
                                width: 500.w,
                                child: AlertDialog(
                                  title: Center(
                                    child: Text(
                                      "Exam Routine",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  content: InteractiveViewer(
                                    maxScale: 7.0,
                                    minScale: 0.1,
                                    child: Image.asset(
                                      "assets/images/Bus Time.jpg",
                                      width: 500.w,
                                      height: 300.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                CardElevatedButton(
                  width: 355.w,
                  height: 84.h,
                  text: 'Batches & Courses',
                  color: 0xFFF8FFAC,
                  onTap: () {
                    facultyBatchesAndCourses(context);
                  },
                ),
                SizedBox(
                  height: 25.w,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: MediaQuery.of(context).size.width / 185.h,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    enlargeCenterPage: true,
                  ),
                  items: announcements.map((announcement) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0x999B9B9B)),
                            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(24)),
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
                                child: Text(
                                  announcement,
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF0D6858),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.black,
                  child: InkWell(
                    borderRadius:
                    BorderRadius.circular(ScreenUtil().setWidth(20)),
                    onTap: () {
                      Get.to(const TeacherAddAnnouncement());
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color(0xFFF8FFAC),
                      child: Icon(
                        Icons.add,
                        size: ScreenUtil().setSp(30),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const FacBottomNavScreen(),
      ),
    );
  }

  void facultyBatchesAndCourses(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return AlertDialog(
              title: Center(
                child: Text(
                  "SELECT BATCH & COURSES",
                  style:
                  TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
                  child: CustomDropdownButton(
                    width: 332.w,
                    height: 51.h,
                    dropDownWidth: 290.w,
                    items: const ['57-A+B', '56-A', '56-B'],
                    value: selectedBatch,
                    hintText: 'Select Batch',
                    onChanged: (value) {
                      setState(() {
                        selectedBatch = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
                  child: CustomDropdownButton(
                    width: 332.w,
                    height: 51.h,
                    dropDownWidth: 290.w,
                    items: const ['CSE-1111', 'EEE-1111', 'CSE-3121'],
                    value: selectedCourse,
                    hintText: 'Select Course',
                    onChanged: (value) {
                      setState(
                            () {
                          selectedCourse = value;
                        },
                      );
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                          width: 2.w,
                        ),
                      ),
                      backgroundColor: const Color(0xFFFFE8D2),
                      foregroundColor: const Color(0x999B9B9B),
                    ),
                    onPressed: () {
                      if (selectedBatch != null && selectedCourse != null) {
                        setState(() {
                          tableData.add({
                            'Batch': selectedBatch!,
                            'Course': selectedCourse!,
                          });
                          selectedBatch = null;
                          selectedCourse = null;
                        });
                      }
                    },
                    child: const Text(
                      "ADD",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
                  child: Container(
                    height: 320.h,
                    width: 343.w,
                    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FFAC),
                      border: Border.all(
                        color: const Color(0x999B9B9B),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setWidth(20)),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Text(
                              'Batch',
                              style: TextStyle(
                                color: const Color(0xFF0D6858),
                                fontWeight: FontWeight.w500,
                                fontSize: 26.sp,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Course',
                              style: TextStyle(
                                color: const Color(0xFF0D6858),
                                fontWeight: FontWeight.w500,
                                fontSize: 26.sp,
                              ),
                            ),
                          ),
                        ],
                        rows: tableData.map(
                              (data) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    data['Batch']!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22.sp,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    data['Course']!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22.sp,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
