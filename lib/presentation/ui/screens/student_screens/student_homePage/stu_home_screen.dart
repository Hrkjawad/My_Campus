import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_homePage/sub_pages/subject_list_add.dart';
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
    //  appBar: customisedAppBar(scaffoldKey, 'ID: 2122020011'),
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
                SizedBox(
                  height: 83.h,
                  width: 370.w,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Expanded(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 380.w,
                                      height: 400.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF8FFAC),
                                        border: Border.all(
                                          color: const Color(0x999B9B9B),
                                        ),
                                        borderRadius: BorderRadius.circular(20.w),
                                      ),
                                    ),
                                    Container(
                                      width: 290.w,
                                      height: 400.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.w),
                                          bottomLeft: Radius.circular(20.w),
                                        ),
                                        border: const Border(
                                          left: BorderSide(
                                            color: Color(0x999B9B9B),
                                          ),
                                          top: BorderSide(
                                            color: Color(0x999B9B9B),
                                          ),
                                          bottom: BorderSide(
                                            color: Color(0x999B9B9B),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 90.w,
                                      height: 400.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF8FFAC),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.w),
                                          bottomLeft: Radius.circular(20.w),
                                        ),
                                        border: const Border(
                                          left: BorderSide(
                                            color: Color(0x999B9B9B),
                                          ),
                                          top: BorderSide(
                                            color: Color(0x999B9B9B),
                                          ),
                                          bottom: BorderSide(
                                            color: Color(0x999B9B9B),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 380.w,
                                      height: 400.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0x999B9B9B),
                                        ),
                                        borderRadius: BorderRadius.circular(20.w),
                                      ),
                                      child: SingleChildScrollView(
                                        child: DataTable(
                                          dataRowMaxHeight: 105.h,
                                          columnSpacing: 24.w,
                                          horizontalMargin: 10.w,
                                          columns: [
                                            DataColumn(
                                              label: Text(
                                                'Type',
                                                style: TextStyle(
                                                  color: const Color(0xFF0D6858),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 26.sp,
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Padding(
                                                padding: EdgeInsets.only(left: 50.0.w),
                                                child: Text(
                                                  'Note',
                                                  style: TextStyle(
                                                    color: const Color(0xFF0D6858),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 26.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Padding(
                                                padding: EdgeInsets.only(left: 50.0.w),
                                                child: Text(
                                                  'Date',
                                                  style: TextStyle(
                                                    color: const Color(0xFF0D6858),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 26.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                          rows: tableData.map(
                                                (data) {
                                              return DataRow(
                                                cells: [
                                                  DataCell(
                                                    GestureDetector(
                                                      onLongPress: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                "Delete Data",
                                                                style: TextStyle(
                                                                    fontSize: 24.sp,
                                                                    fontWeight: FontWeight.w900),
                                                              ),
                                                              content: Text(
                                                                  "Are you sure you want to delete this data?",
                                                                  style: TextStyle(
                                                                      fontSize: 20.sp,
                                                                      fontWeight: FontWeight.w500)),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () {
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: Text("NO",
                                                                      style: TextStyle(
                                                                          fontSize: 18.sp,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.green)),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      tableData.remove(data);
                                                                    });
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: Text("YES",
                                                                      style: TextStyle(
                                                                          fontSize: 18.sp,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.red)),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: SizedBox(
                                                        width: 80.w,
                                                        child: Wrap(
                                                          children: [
                                                            Text(
                                                              data['Type']!,
                                                              softWrap: true,
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 19.sp,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    GestureDetector(
                                                      onLongPress: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                "Delete Data",
                                                                style: TextStyle(
                                                                    fontSize: 24.sp,
                                                                    fontWeight: FontWeight.w900),
                                                              ),
                                                              content: Text(
                                                                  "Are you sure you want to delete this data?",
                                                                  style: TextStyle(
                                                                      fontSize: 20.sp,
                                                                      fontWeight: FontWeight.w500)),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () {
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: Text("NO",
                                                                      style: TextStyle(
                                                                          fontSize: 18.sp,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.green)),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      tableData.remove(data);
                                                                    });
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: Text("YES",
                                                                      style: TextStyle(
                                                                          fontSize: 18.sp,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.red)),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: SizedBox(
                                                        width: 160.w,
                                                        child: Wrap(
                                                          children: [
                                                            Text(
                                                              data['Note']!,
                                                              softWrap: true,
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 19.sp,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    GestureDetector(
                                                      onLongPress: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                "Delete Data",
                                                                style: TextStyle(
                                                                    fontSize: 24.sp,
                                                                    fontWeight: FontWeight.w900),
                                                              ),
                                                              content: Text(
                                                                  "Are you sure you want to delete this data?",
                                                                  style: TextStyle(
                                                                      fontSize: 20.sp,
                                                                      fontWeight: FontWeight.w500)),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () {
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: Text("NO",
                                                                      style: TextStyle(
                                                                          fontSize: 18.sp,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.green)),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      tableData.remove(data);
                                                                    });
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: Text("YES",
                                                                      style: TextStyle(
                                                                          fontSize: 18.sp,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.red)),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: SizedBox(
                                                        width: 80.w,
                                                        child: Wrap(
                                                          children: [
                                                            Text(
                                                              data['Date']!,
                                                              softWrap: true,
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14.sp,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
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
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Card(
                      color: const Color(0xEEE5FEF3),
                      elevation: 3,
                      margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0x999B9B9B)),
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 43.w,),
                              Text(
                                assignment!,
                                style: TextStyle(
                                  fontSize: 34.sp,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFF0D6858),
                                ),
                              ),
                              SizedBox(width: 52.w,),
                              Text(
                                viva!,
                                style: TextStyle(
                                  fontSize: 34.sp,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFF0D6858),
                                ),
                              ),
                              SizedBox(width: 36.w,),
                              Text(
                                tutorial!,
                                style: TextStyle(
                                  fontSize: 34.sp,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFF0D6858),
                                ),
                              ),
                              SizedBox(width: 32.w,),
                              Text(
                                todo!,
                                style: TextStyle(
                                  fontSize: 34.sp,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFF0D6858),
                                ),
                              ),
                              SizedBox(width: 43.w,),
                              Text(
                                presentation!,
                                style: TextStyle(
                                  fontSize: 34.sp,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFF0D6858),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Text(
                                "Assignment",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Viva",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Tutorial",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "ToDo",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Presentation",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15.h,
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
                    CardElevatedButton(
                      width: 142.w,
                      height: 102.h,
                      text: 'Subject\n   List',
                      color: 0xFFF8FFAC,
                      onTap: () {
                        Get.to(const SubjectListAdd());
                      },
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
                                    myAssignment!,
                                    style: TextStyle(
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Assignment",
                                    style: TextStyle(
                                        fontSize: 14.sp,
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
        bottomNavigationBar: const BottomNav(home: StuHomeScreen()),
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
