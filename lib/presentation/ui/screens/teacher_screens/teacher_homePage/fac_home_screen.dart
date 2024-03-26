import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/widgets/fac_main_bottom_nav_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/teacher_add_announcement.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../widgets/appbar_method.dart';
import '../../../widgets/date.dart';
import '../../../widgets/dropdown_button.dart';
import '../../../widgets/fac_drawer_method.dart';
import '../../../widgets/homepage_card_elevated_button.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: const Alignment(0, 0),
                  children: [
                    const SizedBox(
                      width: 355,
                      height: 150,
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          side: BorderSide(color: Color(0x999B9B9B), width: 1),
                        ),
                        color: Color(0xFFCBD0F9),
                      ),
                    ),
                    const Positioned(
                      top: 10, // Adjust top position as needed
                      child: Text(
                        "Today's Schedule",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              width: 80,
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    classes!,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const Text(
                                    "Classes",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 26,
                          ),
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              width: 80,
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    exams!,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const Text(
                                    "Exams",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 26,
                          ),
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              width: 80,
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    myTodo!,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const Text(
                                    "My ToDo",
                                    style: TextStyle(
                                        fontSize: 16,
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
                  width: 355,
                  height: 45,
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 3,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                      side: BorderSide(color: Color(0x999B9B9B), width: 1),
                    ),
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      classAndTime!,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF393939)),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Date(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardElevatedButton(
                      width: 142,
                      height: 102,
                      text: '    My\nClasses',
                      color: 0xFFACFFDC,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 71,
                    ),
                    CardElevatedButton(
                      width: 142,
                      height: 102,
                      text: '  Exam\nRoutine',
                      color: 0xFFFFE8D2,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 300,
                                width: 500,
                                child: AlertDialog(
                                  title: const Center(
                                    child: Text(
                                      "Exam Routine",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  content: InteractiveViewer(
                                    maxScale: 7.0,
                                    minScale: 0.1,
                                    child: Image.asset(
                                      "assets/images/Bus Time.jpg",
                                      width: 500,
                                      height: 300,
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
                const SizedBox(
                  height: 25,
                ),
                CardElevatedButton(
                  width: 355,
                  height: 84,
                  text: 'Batches & Courses',
                  color: 0xFFF8FFAC,
                  onTap: () {
                    facultyBatchesAndCourses(context);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: MediaQuery.of(context).size.width / 185,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
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
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Text(
                                  announcement,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF0D6858),
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
                const SizedBox(height: 5,),
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.black,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Get.to(const TeacherAddAnnouncement());
                    },
                    child: const CircleAvatar(
                      radius: 26,
                      backgroundColor: Color(0xFFF8FFAC),
                      child: Icon(
                        Icons.add,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const FacBottomNavScreen(),
              ],
            ),
          ),
        ),
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
              title: const Center(
                child: Text(
                  "SELECT BATCH & COURSES",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomDropdownButton(
                    width: 332,
                    height: 51,
                    dropDownWidth: 290,
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
                  padding: const EdgeInsets.all(12.0),
                  child: CustomDropdownButton(
                    width: 332,
                    height: 51,
                    dropDownWidth: 290,
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
                      shape: const CircleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                          width: 2,
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
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 320,
                    width: 343,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FFAC),
                      border: Border.all(
                        color: const Color(0x999B9B9B),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: DataTable(
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Batch',
                              style: TextStyle(
                                color: Color(0xFF0D6858),
                                fontWeight: FontWeight.w500,
                                fontSize: 26,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Course',
                              style: TextStyle(
                                color: Color(0xFF0D6858),
                                fontWeight: FontWeight.w500,
                                fontSize: 26,
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
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    data['Course']!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
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
