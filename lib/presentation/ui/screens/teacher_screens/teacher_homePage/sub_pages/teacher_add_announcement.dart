import 'package:flutter/material.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../widgets/appbar_method.dart';
import '../../../../widgets/date_select.dart';
import '../../../../widgets/dropdown_button.dart';
import '../../../../widgets/fac_drawer_method.dart';
import '../../../../widgets/text_fields.dart';

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
      key: scaffoldKey,
      appBar: customisedAppBar(scaffoldKey, 'Teacher mail'),
      drawer: customisedFacultyDrawer(context),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  width: 380,
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xBBB2FF9E),
                    border: Border.all(
                      color: const Color(0x999B9B9B),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 23,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: taskController,
                          hintText: 'Type Announcement',
                          height: 45,
                          width: 360,
                          onChanged: (value) {
                            setState(() {
                              selectedAnnouncement = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomDropdownButton(
                          width: 360,
                          height: 45,
                          dropDownWidth: 360,
                          items: const ['57-A+B', '56-A', '56-B'],
                          value: selectedBatch,
                          hintText: 'Select Batch',
                          onChanged: (value) {
                            setState(() {
                              selectedBatch = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomDatePicker(
                          controller: dateInput,
                          width: 360,
                          height: 45,
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
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 360,
                      height: 55,
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
                            borderRadius: BorderRadius.circular(50.0),
                            side: const BorderSide(color: Color(0x999B9B9B)),
                          ),
                        ),
                        child: const Text(
                          "ADD",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: 450,
                          width: 380,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0x999B9B9B),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: DataTable(
                                dataRowMaxHeight: 105,
                                columnSpacing: 25,
                                horizontalMargin: 10,
                                columns: const [
                                  DataColumn(
                                    label: SizedBox(
                                      width: 250,
                                      child: Center(
                                        child: Text(
                                          'Announcements',
                                          style: TextStyle(
                                            color: Color(0xFF0D6858),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 26,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 85,
                                      child: Center(
                                        child: Text(
                                          'Batch',
                                          style: TextStyle(
                                            color: Color(0xFF0D6858),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 26,
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
                                                    title: const Text(
                                                      "Delete Data",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    content: const Text(
                                                      "Are you sure you want to delete this data?",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          "NO",
                                                          style: TextStyle(
                                                              fontSize: 18,
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
                                                        child: const Text(
                                                          "YES",
                                                          style: TextStyle(
                                                              fontSize: 18,
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
                                              width: 250,
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    data['announcement']!,
                                                    softWrap: true,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20,
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
                                                    title: const Text(
                                                      "Delete Data",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    content: const Text(
                                                      "Are you sure you want to delete this data?",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          "NO",
                                                          style: TextStyle(
                                                              fontSize: 18,
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
                                                        child: const Text(
                                                          "YES",
                                                          style: TextStyle(
                                                              fontSize: 18,
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
                                              width: 100,
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    data['Batch']!,
                                                    softWrap: true,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 24,
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
                          left: 280,
                          top: 0,
                          bottom: 18,
                          child: Container(
                            width: 1,
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
      ),
    );
  }
}
