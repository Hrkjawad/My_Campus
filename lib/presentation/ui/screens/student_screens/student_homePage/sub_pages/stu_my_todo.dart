import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../widgets/appbar_method.dart';
import '../../../../widgets/date_select.dart';
import '../../../../widgets/stu_drawer_method.dart';
import '../../../../widgets/text_fields.dart';
import '../../../../widgets/bottom_nav.dart';
import '../stu_home_screen.dart';

class StuMyTodo extends StatefulWidget {
  const StuMyTodo({super.key});

  @override
  State<StuMyTodo> createState() => _StuMyTodoState();
}

class _StuMyTodoState extends State<StuMyTodo> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedDate, selectedTask;
  List<Map<String, String>> tableData = [];
  late TextEditingController _dateInputTEController;
  late TextEditingController _taskTEController;

  @override
  void initState() {
    super.initState();
    _dateInputTEController = TextEditingController();
    _taskTEController = TextEditingController();
  }

  @override
  void dispose() {
    _dateInputTEController.dispose();
    _taskTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, 'ID: 2122020011'),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedStudentDrawer(context),
        body: ScreenBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 23.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TITLE       :  ",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomTextField(
                    controller: _taskTEController,
                    hintText: 'Enter Text',
                    height: 44.50.h,
                    width: 258.w,
                    onChanged: (value) {
                      setState(() {
                        selectedTask = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DATE        :  ",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomDatePicker(
                    controller: _dateInputTEController,
                    width: 258.w,
                    height: 44.50.h,
                    onChanged: (value) {
                      setState(() {
                        selectedDate = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: SizedBox(
                  width: 380.w,
                  height: 58.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0.w),
                        side: const BorderSide(color: Color(0x999B9B9B)),
                      ),
                    ),
                    onPressed: () {
                      if (selectedTask != null && selectedDate != null) {
                        setState(() {
                          tableData.add({
                            'Your_Note': selectedTask!,
                            'Date': selectedDate!
                          });
                          selectedDate = null;
                          selectedTask = null;
                          _dateInputTEController.clear();
                          _taskTEController.clear();
                        });
                      }
                    },
                    child: Text(
                      "ADD",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.0.w),
                  child: Stack(
                    children: [
                      Container(
                        width: 380.w,
                        height: 500.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FFAC),
                          border: Border.all(
                            color: const Color(0x999B9B9B),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.w),
                          ),
                        ),
                      ),
                      Container(
                        width: 280.w,
                        height: 500.h,
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
                        height: 500.h,
                        width: 380.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0x999B9B9B),
                          ),
                          borderRadius: BorderRadius.circular(20.w),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(left: 0.0.w),
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
                                        'Your Note',
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
                                        'Date',
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
                                              builder: (BuildContext context) {
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
                                                              FontWeight.w500)),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text("NO",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .green)),
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
                                                      child: Text("YES",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.red)),
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
                                                  data['Your_Note']!,
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
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  content: Text(
                                                      "Are you sure you want to delete this data?",
                                                      style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text("NO",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .green)),
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
                                                      child: Text("YES",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.red)),
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
                                                  data['Date']!,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.sp,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:  BottomNav(home: StuHomeScreen()),
      ),
    );
  }
}
