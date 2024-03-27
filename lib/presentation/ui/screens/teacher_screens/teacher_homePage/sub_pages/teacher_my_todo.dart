import 'package:flutter/material.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../widgets/appbar_method.dart';
import '../../../../widgets/date_select.dart';
import '../../../../widgets/fac_drawer_method.dart';
import '../../../../widgets/text_fields.dart';
import '../../../../widgets/fac_main_bottom_nav_screen.dart';

class FacMyTodo extends StatefulWidget {
  const FacMyTodo({super.key});

  @override
  State<FacMyTodo> createState() => _FacMyTodoState();
}

class _FacMyTodoState extends State<FacMyTodo> {
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
      appBar: customisedAppBar(scaffoldKey),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "TITLE       :  ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomTextField(
                    controller: _taskTEController,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "DATE        :  ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomDatePicker(
                    controller: _dateInputTEController,
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
              Center(
                child: SizedBox(
                  width: 380,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: const BorderSide(color: Color(0x999B9B9B)),
                      ),
                    ),
                    onPressed: () {
                      if (selectedTask != null && selectedDate != null) {
                        setState(() {
                          tableData.add({
                            'Meeting_Title': selectedTask!,
                            'Date': selectedDate!
                          });
                          selectedDate = null;
                          selectedTask = null;
                          _dateInputTEController.clear();
                          _taskTEController.clear();
                        });
                      }
                    },
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
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 500,
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
                        width: 280,
                        height: 500,
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
                        height: 500,
                        width: 380,
                        decoration: BoxDecoration(
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
                                        'Meeting Title',
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
                                        'Date',
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
                                              builder: (BuildContext context) {
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
                                                              FontWeight.w500)),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text("NO",
                                                          style: TextStyle(
                                                              fontSize: 18,
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
                                                      child: const Text("YES",
                                                          style: TextStyle(
                                                              fontSize: 18,
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
                                            width: 250,
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  data['Meeting_Title']!,
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
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  content: const Text(
                                                      "Are you sure you want to delete this data?",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text("NO",
                                                          style: TextStyle(
                                                              fontSize: 18,
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
                                                      child: const Text("YES",
                                                          style: TextStyle(
                                                              fontSize: 18,
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
                                            width: 100,
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  data['Date']!,
                                                  softWrap: true,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
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
              const FacBottomNavScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
