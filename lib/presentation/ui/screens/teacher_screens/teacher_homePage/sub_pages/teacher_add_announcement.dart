import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../widgets/appbar_method.dart';
import '../../../../widgets/date_select.dart';
import '../../../../widgets/dropdown_button.dart';
import '../../../../widgets/fac_drawer_method.dart';
import '../../../../widgets/text_fields.dart';
import '../../../../widgets/bottom_nav.dart';

class TeacherAddAnnouncement extends StatefulWidget {
  const TeacherAddAnnouncement({super.key});

  @override
  State<TeacherAddAnnouncement> createState() => _TeacherAddAnnouncementState();
}

class _TeacherAddAnnouncementState extends State<TeacherAddAnnouncement> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedDate, selectedAnnouncement, selectedBatch;
  List<Map<String, String>> tableData = [];
  late TextEditingController dateInput;
  late TextEditingController taskController;

  @override
  void initState() {
    super.initState();
    dateInput = TextEditingController();
    taskController = TextEditingController();
  }

  @override
  void dispose() {
    dateInput.dispose();
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, 'Teacher mail'),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: Stack(
            children: [
              Positioned(
                top: 15.h,
                left: 20.w,
                child: Container(
                  width: 380.w,
                  height: 320.h,
                  decoration: BoxDecoration(
                    color: const Color(0xBBB2FF9E),
                    border: Border.all(
                      color: const Color(0x999B9B9B),
                    ),
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 23.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                          controller: taskController,
                          hintText: 'Type Announcement',
                          height: 45.h,
                          width: 360.w,
                          onChanged: (value) {
                            setState(() {
                              selectedAnnouncement = value;
                            });
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomDropdownButton(
                          width: 360.w,
                          height: 45.h,
                          dropDownWidth: 360.w,
                          items: const ['57-A+B', '56-A', '56-B'],
                          value: selectedBatch,
                          hintText: 'Select Batch',
                          onChanged: (value) {
                            setState(() {
                              selectedBatch = value;
                            });
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomDatePicker(
                          controller: dateInput,
                          width: 360.w,
                          height: 45.h,
                          onChanged: (value) {
                            setState(() {
                              selectedDate = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: SizedBox(
                      width: 360.w,
                      height: 58.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedAnnouncement != null &&
                              selectedDate != null &&
                              selectedBatch != null) {
                            setState(() {
                              tableData.add({
                                'announcement':
                                    "${selectedDate!} -> ${selectedAnnouncement!}",
                                'Batch': selectedBatch!
                              });
                              selectedDate = null;
                              selectedAnnouncement = null;
                              selectedBatch = null;
                              dateInput.clear();
                              taskController.clear();
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF8FFAC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.w),
                            side: const BorderSide(color: Color(0x999B9B9B)),
                          ),
                        ),
                        child: Text(
                          "ADD",
                          style: TextStyle(
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: 450.h,
                          width: 380.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0x999B9B9B),
                            ),
                            borderRadius: BorderRadius.circular(20.w),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(left: 0.w),
                              child: DataTable(
                                dataRowMaxHeight: 105.h,
                                columnSpacing: 25.w,
                                horizontalMargin: 10.w,
                                columns: [
                                  DataColumn(
                                    label: SizedBox(
                                      width: 250.w,
                                      child: Center(
                                        child: Text(
                                          'Announcements',
                                          style: TextStyle(
                                            color: const Color(0xFF0D6858),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 26.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 85.w,
                                      child: Center(
                                        child: Text(
                                          'Batch',
                                          style: TextStyle(
                                            color: const Color(0xFF0D6858),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 26.sp,
                                          ),
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
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      "Delete Data",
                                                      style: TextStyle(
                                                          fontSize: 24.sp,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    content: Text(
                                                      "Are you sure you want to delete this data?",
                                                      style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          "NO",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.green),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            tableData
                                                                .remove(data);
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          "YES",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: SizedBox(
                                              width: 250.w,
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    data['announcement']!,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20.sp,
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
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      "Delete Data",
                                                      style: TextStyle(
                                                          fontSize: 24.sp,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    content: Text(
                                                      "Are you sure you want to delete this data?",
                                                      style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          "NO",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.green),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            tableData
                                                                .remove(data);
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          "YES",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: SizedBox(
                                              width: 100.w,
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    data['Batch']!,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 24.sp,
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
                        ),
                        Positioned(
                          left: 280.w,
                          top: 0.h,
                          height: 450.h,
                          child: Container(
                            width: 1.w,
                            color: const Color(0x999B9B9B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}
