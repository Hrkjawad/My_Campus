import 'package:flutter/material.dart';
import 'package:my_campus/presentation/ui/widgets/appbar_method.dart';
import 'package:my_campus/presentation/ui/widgets/customised_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/fac_drawer_method.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../widgets/customised_titles_method.dart';
import '../../../../widgets/date_select.dart';
import '../../../../widgets/dropdown_button.dart';
import '../../../../widgets/text_fields.dart';

class FacAddTask extends StatefulWidget {
  const FacAddTask({super.key});

  @override
  State<FacAddTask> createState() => _FacAddTaskState();
}

class _FacAddTaskState extends State<FacAddTask> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedBatch, selectedSubject, selectedDate, selectedTask;
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
      key: scaffoldKey,
      appBar: customisedAppBar(scaffoldKey, 'Teacher email'),
      drawer: customisedFacultyDrawer(context),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  customisedTitles('BATCH     :  '),
                  CustomDropdownButton(
                    width: 258,
                    height: 44.50,
                    dropDownWidth: 258,
                    items: const ['57-A+B', '56-A', '56-B'],
                    value: selectedBatch,
                    hintText: 'Select',
                    onChanged: (value) {
                      setState(() {
                        selectedBatch = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  customisedTitles('SUBJECT :  '),
                  CustomDropdownButton(
                    width: 258,
                    dropDownWidth: 258,
                    height: 44.50,
                    items: const ['CSE-1111', 'EEE-1111', 'CSE-3121'],
                    value: selectedSubject,
                    hintText: 'Select',
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  customisedTitles('TASK        :  '),
                  CustomTextField(
                    controller: taskController,
                    hintText: 'Enter Text',
                    height: 44.50,
                    width: 258,
                    onChanged: (value) {
                      setState(() {
                        selectedTask = value;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  customisedTitles('DATE         :  '),
                  CustomDatePicker(
                    controller: dateInput,
                    width: 258,
                    height: 44.50,
                    onChanged: (value) {
                      setState(() {
                        selectedDate = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomisedElevatedButton(
                  onTap: () {
                    if (selectedBatch != null &&
                        selectedSubject != null &&
                        selectedTask != null &&
                        selectedDate != null) {
                      setState(() {
                        tableData.add({
                          'Batch': selectedBatch!,
                          'Exam&Task':
                              "${selectedSubject!} -> ${selectedTask!}",
                          'Date': selectedDate!
                        });
                        selectedBatch = null;
                        selectedSubject = null;
                        selectedDate = null;
                        selectedTask = null;
                        dateInput.clear();
                        taskController.clear();
                      });
                    }
                  },
                  text: 'SUBMIT'),
              const SizedBox(
                height: 20,
              ),
              batchExamTaskDateMethod(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded batchExamTaskDateMethod(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: Stack(
          children: [
            Container(
              width: 380,
              height: 380,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FFAC),
                border: Border.all(
                  color: const Color(0x999B9B9B),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            Container(
              width: 290,
              height: 380,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                border: Border(
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
              width: 90,
              height: 380,
              decoration: const BoxDecoration(
                color: Color(0xFFF8FFAC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                border: Border(
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
              height: 380,
              width: 380,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0x999B9B9B),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: DataTable(
                  dataRowMaxHeight: 105,
                  columnSpacing: 24,
                  horizontalMargin: 10,
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
                        'Exam & Task',
                        style: TextStyle(
                          color: Color(0xFF0D6858),
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Date',
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
                            GestureDetector(
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Delete Data",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      content: const Text(
                                          "Are you sure you want to delete this data?",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("NO",
                                              style: TextStyle(
                                                  fontSize: 18,
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
                                          child: const Text("YES",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red)),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: SizedBox(
                                width: 80,
                                child: Wrap(
                                  children: [
                                    Text(
                                      data['Batch']!,
                                      softWrap: true,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19,
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
                                      title: const Text(
                                        "Delete Data",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      content: const Text(
                                          "Are you sure you want to delete this data?",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("NO",
                                              style: TextStyle(
                                                  fontSize: 18,
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
                                          child: const Text("YES",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red)),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: SizedBox(
                                width: 160,
                                child: Wrap(
                                  children: [
                                    Text(
                                      data['Exam&Task']!,
                                      softWrap: true,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19,
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
                                      title: const Text(
                                        "Delete Data",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      content: const Text(
                                          "Are you sure you want to delete this data?",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("NO",
                                              style: TextStyle(
                                                  fontSize: 18,
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
                                          child: const Text("YES",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red)),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: SizedBox(
                                width: 80,
                                child: Wrap(
                                  children: [
                                    Text(
                                      data['Date']!,
                                      softWrap: true,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
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
    );
  }
}
