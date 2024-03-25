import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_main_bottom_nav_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/teacher_add_announcement.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/dropdown_button.dart';
import '../../../widgets/homepage_card_elevatedbutton.dart';
import '../../../widgets/main_drawer.dart';

class FacHomeScreen extends StatefulWidget {
  const FacHomeScreen({super.key});

  @override
  State<FacHomeScreen> createState() => _FacHomeScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _FacHomeScreenState extends State<FacHomeScreen> {
  List<Map<String, String>> tableData = [];
  String? selectedBatch, selectedCourse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: facAppBar(scaffoldKey),
      drawer: facultyDrawer(context),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 355,
                height: 160,
                child: ListView.builder(
                  shrinkWrap: false,
                  primary: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 292,
                      height: 151,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(40),
                        child: Stack(
                          children: [
                            Card(
                              color: const Color(0xFFCBD0F9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Today's Schedules",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 59,
                                          height: 53,
                                          child: Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '4',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  'Classes',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 59,
                                          height: 53,
                                          child: Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '0',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  'Exams',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 59,
                                          height: 53,
                                          child: Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '0',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  'My ToDo',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const SizedBox(
                                      width: double.infinity,
                                      height: 28,
                                      child: Card(
                                        //  elevation: 5,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(20),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Room: RAB 302 - 10:35 AM',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 48,
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
                              width: double.infinity,
                              height: 250,
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
                                  boundaryMargin: const EdgeInsets.all(20),
                                  minScale: 0.1,
                                  maxScale: 6.0,
                                  child: Image.asset(
                                    width: 400,
                                    height: 400,
                                    'assets/images/Bus Time.jpg',
                                    fit: BoxFit.contain,
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
                height: 29,
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
              const SizedBox(
                width: double.infinity,
                height: 185,
                child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Announcements',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0D6858),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
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
              ),
              const FacBottomNavScreen(),
            ],
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
