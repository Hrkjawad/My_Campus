import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_creating_sub_grp_batch_sec_controller.dart';
import 'package:my_campus/presentation/ui/widgets/fac_main_bottom_nav_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/teacher_add_announcement.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../widgets/appbar_method.dart';
import '../../../widgets/classes_exams_todo.dart';
import '../../../widgets/date.dart';
import '../../../widgets/dropdown_button.dart';
import '../../../widgets/fac_announcement_slider.dart';
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
  String classes = "4";
  String exams = "1";
  String myTodo = "3";

  final List<String> announcements = [
    '57-A+B | Next Sunday is Viva ',
    '56-A | Next Sunday is Tutorial ',
    '60-E | Next Sunday Class is Canceled ',
  ];

  final Map<String, String> courseTitleAndCode = {
    'CSE-1111': 'Introduction to Computer',
    'CSE-1112': 'Introduction to Software',
    'CSE-1113': 'Introduction to Hardware',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClassesExamsToDo(
                    classes: classes,
                    exams: exams,
                    myTodo: myTodo,
                    classAndTime: classAndTime),
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
                          },
                        );
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
                //FacAnnouncementSlider(announcements: announcements),
                GetBuilder<FacAnnouncementController>(
                  builder: (facAnnouncementController) {
                    if (facAnnouncementController.facAnnouncementInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.teal),
                      );
                    }
                    if (facAnnouncementController
                            .facAnnouncementModel.data?.isEmpty ??
                        true) {
                      return Container(
                        width: 323,
                        height: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0x999B9B9B),
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Center(
                          child: Text(
                            'No Announcements',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return FacAnnouncementSlider(
                        announcements: facAnnouncementController
                                .facAnnouncementModel.data ??
                            [],
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.black,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Get.to(
                        const TeacherAddAnnouncement(),
                      );
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
                    items: const ['57-A+B', '56-A', '56-B'],
                    value: selectedBatch,
                    hintText: 'Select Section',
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
                  child: GetBuilder<FacCreatingSubGrpBatchSecController>(
                      builder: (facCreatingSubGrpBatchSecController) {
                    if (facCreatingSubGrpBatchSecController
                        .facCreatingSubGrpBatchSecInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.teal),
                      );
                    }
                    return ElevatedButton(
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
                      onPressed: () async {
                        if (selectedBatch != null && selectedCourse != null) {
                          final result =
                              await facCreatingSubGrpBatchSecController
                                  .facCreatingSubGrpBatchSec(
                                      '57', 'A+Bdd', 'CSE-1111', 'CSE');
                          if (result) {
                            Get.snackbar('Successful!',
                                facCreatingSubGrpBatchSecController.message);
                            setState(() {
                              tableData.add({
                                'Batch': selectedBatch!,
                                'Course': selectedCourse!,
                              });
                              selectedBatch = null;
                              selectedCourse = null;
                            });
                          } else {
                            Get.snackbar('Failed!',
                                facCreatingSubGrpBatchSecController.message,
                                colorText: Colors.redAccent);
                          }
                        }
                      },
                      child: const Text(
                        "ADD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }),
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
