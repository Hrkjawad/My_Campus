import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/batch_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_main_bottom_controller.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_homePage/student_subPages/stu_class_routinue.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_homePage/student_subPages/stu_subj_list_add_screen.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../widgets/appbar_method.dart';
import '../../../widgets/date.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/dropdown_button.dart';
import '../../../widgets/stu_drawer_method.dart';
import '../../../widgets/homepage_card_elevated_button.dart';

class StuHomeScreen extends StatefulWidget {
  const StuHomeScreen({super.key});

  @override
  State<StuHomeScreen> createState() => _StuHomeScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _StuHomeScreenState extends State<StuHomeScreen> {
  TextEditingController batchController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  List<Map<String, String>> tableData = [];
  String? selectedBatch,
      viva = "5",
      assignment = "5",
      tutorial = "3",
      todo = "10",
      presentation = "1";

  int _currentAnnouncement = 0;
  late Timer _timer;
  late PageController _announcementPageController;

  @override
  void initState() {
    super.initState();
    _announcementPageController =
        PageController(initialPage: _currentAnnouncement);
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Assignment');
      Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Tutorial');
      Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Viva');
      Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Lab Report');
    });
  }

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

  //api table data fetch
  String? classAndTime = "Room: 302, RAB - 10.30 AM";
  String? classes = "4";
  String? exams = "1";
  String? myTodo = "3";
  String? myAssignment = "2";

  final List<String> announcements = [
    'CSE 1111 | Next Sunday is Viva ',
    'CSE 2222 | Next Sunday is Tutorial ',
    'EEE 1111 | Next Sunday Class is Canceled ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, context),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedStudentDrawer(context),
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                buildTasksType(),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 134.h,
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
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardElevatedButton(
                      width: 142.w,
                      height: 102.h,
                      text: '    My\nClasses',
                      color: 0xFFACFFDC,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Write Batch'),
                                content: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        controller: batchController,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextFormField(
                                        controller: sectionController,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: Colors.black),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel')),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: Colors.black),
                                      onPressed: () {
                                        Get.to(() => StuClassRoutinue(
                                              batch: batchController.text,
                                              section: sectionController.text,
                                            ));
                                      },
                                      child: const Text('Go'))
                                ],
                              );
                            });
                      },
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
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardElevatedButton(
                      width: 142.w,
                      height: 102.h,
                      text: 'Cover\nPage',
                      color: 0xBBB2FF9E,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 71.w,
                    ),
                    GetBuilder<StuMainBottomNavController>(
                      builder: (stuMainBottomNavController) {
                        return CardElevatedButton(
                          width: 142.w,
                          height: 102.h,
                          text: 'Subject\n   List',
                          color: 0xFFF8FFAC,
                          onTap: () async{
                            stuMainBottomNavController.changeScreen(1);
                          },
                        );
                      }
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Stack(
                  alignment: Alignment(0.w, 0.w),
                  children: [
                    SizedBox(
                      width: 355.w,
                      height: 140.h,
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.w),
                            bottomRight: Radius.circular(0.w),
                            topLeft: Radius.circular(40.w),
                            topRight: Radius.circular(40.w),
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
                      top: 45.h,
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
                            width: 8.w,
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
                            width: 8.w,
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
                        bottomLeft: Radius.circular(40.w),
                        bottomRight: Radius.circular(40.w),
                        topLeft: Radius.circular(0.w),
                        topRight: Radius.circular(0.w),
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
                    )),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Date(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          mini: true,
          hoverColor: const Color(0xFFFFE8D2),
          backgroundColor: const Color(0xFFF8FFAC),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          "SELECT YOUR BATCH",
                          style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w900,
                              color: const Color(0xFF0D6858)),
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
                        SizedBox(
                          height: 15.h,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: const Color(0xFF9B9B9B),
                                  width: 1.w,
                                ),
                              ),
                              backgroundColor: const Color(0xFFF8FFAC),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "OK",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          child: Icon(
            Icons.add,
            size: 30.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  SizedBox buildTasksType() {
    return SizedBox(
                height: 115.h,
                width: 382.h,
                child: Card(
                  color: AppColors.primaryColor,
                  elevation: 3,
                  shadowColor: Colors.blue,
                  child: Center(
                    child: GetBuilder<BatchAnnouncementController>(
                      builder: (batchAnnouncementController) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  child: Text(batchAnnouncementController.assignment.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text('Assignment', style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  child: Text(
                                    batchAnnouncementController.tutorial.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text('Tutorial', style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  child: Text(
                                    batchAnnouncementController.viva.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text('Viva', style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  child: Text(
                                    batchAnnouncementController.labReport.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text('Lab Report', style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),

                          ],
                        );
                      }
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
}
