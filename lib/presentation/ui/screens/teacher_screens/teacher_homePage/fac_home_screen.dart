import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_main_bottom_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/fac_chat_screen.dart';
import 'package:my_campus/presentation/ui/widgets/bottom_nav.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/fac_announcement.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../state_holders/faculty_state_holders/fac_announcement_controller.dart';
import '../../../../state_holders/faculty_state_holders/fac_creating_sub_grp_batch_sec_controller.dart';
import '../../../../state_holders/faculty_state_holders/fac_show_group_batch_section_course_controller.dart';
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

  int _currentAnnouncement = 0;
  late Timer _timer;
  late PageController _announcementPageController;

  //api table data fetch
  String? classAndTime = "Room: 302, RAB - 10.30 AM";
  String? classes = "4";
  String? exams = "1";
  int? myTodo = 0;

  final List<String> announcements = [
    '57-A+B | Next Sunday is Viva ',
    '56-A | Next Sunday is Tutorial ',
    '60-E | Next Sunday Class is Canceled ',
  ];

  @override
  void initState() {
    super.initState();
    _announcementPageController =
        PageController(initialPage: _currentAnnouncement);
    _startTimer();
    //Get.find<FacAnnouncementController>().facShowAnnouncement();
  } //

  @override
  void dispose() {
    _timer.cancel();
    _announcementPageController.dispose();
    super.dispose();
  }



  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_announcementPageController.page == null) return;
      final nextPage = (_announcementPageController.page!.toInt() + 1) %
          announcements.length;
      _announcementPageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: //customisedAppBar(scaffoldKey),
          customisedAppBar(scaffoldKey, context),
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
                            bottomLeft: Radius.circular(
                              ScreenUtil().setWidth(0),
                            ),
                            bottomRight: Radius.circular(
                              ScreenUtil().setWidth(0),
                            ),
                            topLeft: Radius.circular(
                              ScreenUtil().setWidth(40),
                            ),
                            topRight: Radius.circular(
                              ScreenUtil().setWidth(40),
                            ),
                          ),
                          side: BorderSide(
                              color: const Color(0x999B9B9B), width: 1.w),
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
                          InkWell(
                            onTap: () {
                              Get.find<FacMainBottomNavController>().changeScreen(3);
                            },
                            child: ClipOval(
                              child: Container(
                                color: Colors.white,
                                width: 80.w,
                                height: 80.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('${Get.find<FacAnnouncementController>().facShowAnnouncementModel.data?.length ?? '0'}',
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
                        bottomLeft: Radius.circular(
                          ScreenUtil().setWidth(40),
                        ),
                        bottomRight: Radius.circular(
                          ScreenUtil().setWidth(40),
                        ),
                        topLeft: Radius.circular(
                          ScreenUtil().setWidth(0),
                        ),
                        topRight: Radius.circular(
                          ScreenUtil().setWidth(0),
                        ),
                      ),
                      side: BorderSide(
                          color: const Color(0x999B9B9B), width: 1.w),
                    ),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        classAndTime!,
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF393939)),
                      ),
                    ),
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
                GetBuilder<FacMainBottomNavController>(
                    builder: (facMainBottomNavController) {
                  return CardElevatedButton(
                    width: 355.w,
                    height: 84.h,
                    text: 'Batches & Courses',
                    color: 0xFFF8FFAC,
                    onTap: () async {
                      facMainBottomNavController.changeScreen(1);
                    },
                  );
                }),
                SizedBox(
                  height: 25.w,
                ),
                SizedBox(
                  height: 200.h,
                  width: 375.w,
                  child: PageView.builder(
                    itemCount: announcements.length,
                    controller: _announcementPageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentAnnouncement = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return buildAnnouncementCard(announcements[index]);
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.black,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(20),
                    ),
                    onTap: () {
                      Get.to(
                        () => const FacAnnouncementScreen(),
                      );
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color(0xFFF8FFAC),
                      child: Icon(
                        Icons.add,
                        size: 30.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAnnouncementCard(String announcement) {
    return GestureDetector(
      onLongPress: () {
        _timer.cancel();
      },
      onLongPressEnd: (_) {
        _startTimer();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0x999B9B9B)),
          borderRadius: BorderRadius.circular(33.w),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(33.w),
              child: Text(
                announcement,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0D6858),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> batch = ['57', '58', '59', '60'];
}
