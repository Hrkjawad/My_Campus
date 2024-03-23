import 'package:flutter/material.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../widgets/app_logo.dart';
import '../../../../widgets/date_select.dart';
import '../../../../widgets/dropdown_button.dart';
import '../../../../widgets/text_fields.dart';

class FacTeacherAndTask extends StatefulWidget {
  const FacTeacherAndTask({super.key});

  @override
  State<FacTeacherAndTask> createState() => _FacTeacherAndTaskState();
}

class _FacTeacherAndTaskState extends State<FacTeacherAndTask> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.25,
        leading: IconButton(
          icon: const AppLogo(),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('Teacher mail'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.red,
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        width: 286,
        backgroundColor: const Color(0xFFE0FFF1),
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: const Center(
                child: Text(
                  'Batches CR Number',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
                ),
              ),
              hoverColor: Colors.grey,
              onTap: () {},
            ),
            const Divider(
              color: Color(0xFF0D6858),
              height: 3,
              thickness: 1,
            ),
            ListTile(
              title: const Center(
                child: Text(
                  'Bus Schedules',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
                ),
              ),
              hoverColor: Colors.grey,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Image.asset('assets/images/Bus Time.jpg'),
                  ),
                );
              },
            ),
            const Divider(
              color: Color(0xFF0D6858),
              height: 3,
              thickness: 1,
            ),
            ListTile(
              title: const Center(
                child: Text(
                  'Faculty Numbers',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
                ),
              ),
              hoverColor: Colors.grey,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, StateSetter setState) {
                        return SingleChildScrollView(
                          child: AlertDialog(
                            title: const Center(
                              child: Column(
                                children: [
                                  Text(
                                    "Faculty",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  LinearProgressIndicator(
                                    value: .5,
                                  )
                                ],
                              ),
                            ),
                            actions: [
                              for (int i = 0; i < 20; i++)
                                const Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        child: Icon(
                                          Icons.person,
                                          size: 35,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      title: Text(
                                        'Pritiraj Battacharje',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16,
                                            letterSpacing: .6),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            'Lecturer',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'CSE Department',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Email: prb@lus.ac.bd',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 3,
                                    )
                                  ],
                                )
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            const Divider(
              color: Color(0xFF0D6858),
              height: 3,
              thickness: 1,
            ),
            ListTile(
              title: const Center(
                child: Text(
                  'Add Tasks',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
                ),
              ),
              hoverColor: Colors.grey,
              onTap: () {},
            ),
            const Divider(
              color: Color(0xFF0D6858),
              height: 3,
              thickness: 1,
            ),
            ListTile(
              title: const Center(
                child: Text(
                  'My ToDo',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
                ),
              ),
              hoverColor: Colors.grey,
              onTap: () {},
            ),
            const Divider(
              color: Color(0xFF0D6858),
              height: 3,
              thickness: 1,
            ),
            const SizedBox(height: 480),
            const Center(
              child: Text(
                'V 1.0',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
              ),
            ),
          ],
        ),
      ),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  const Text(
                    "BATCH     :  ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
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
                  const Text(
                    "SUBJECT :  ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
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
                  const Text(
                    "TASK        :  ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
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
                  const Text(
                    "DATE         :  ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
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
              Center(
                child: SizedBox(
                  width: 258,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
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
                    child: const Text(
                      "SUBMIT",
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
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        width: 370,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
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
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 400,
                        width: 380, // Adjust the width of the DataTable
                        child: DataTable(
                          columnSpacing: 20,
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
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        data['Batch']!,
                                        softWrap: true,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: 160,
                                      child: Text(
                                        data['Exam&Task']!,
                                        softWrap: true,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        data['Date']!,
                                        softWrap: true,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
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
            ],
          ),
        ),
      ),
    );
  }
}
