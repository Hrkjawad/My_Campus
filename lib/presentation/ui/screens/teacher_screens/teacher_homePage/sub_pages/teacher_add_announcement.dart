import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../../state_holders/faculty_state_holders/fac_main_bottom_nav_controller.dart';
import '../../../../widgets/app_logo.dart';
import '../../../../widgets/date_select.dart';
import '../../../../widgets/dropdown_button.dart';
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
                showDialog(
                    context: context,
                    builder: (context) {
                      return
                        SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: AlertDialog(
                            title: const Center(
                              child: Text(
                                "Bus Schedules",
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            ),
                            content: InteractiveViewer(
                              boundaryMargin: const EdgeInsets.all(20),
                              minScale: 0.1,
                              maxScale: 6.0,
                              child: Image.asset(
                                'assets/images/Bus Time.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                        );
                    });
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
              onTap: () {
                Get.find<FacMainBottomNavController>().changeScreen(1);
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
                  'My ToDo',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
                ),
              ),
              hoverColor: Colors.grey,
              onTap: () {
                Get.find<FacMainBottomNavController>().changeScreen(2);
              },
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
                        const SizedBox(height: 10,),
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
                        const SizedBox(height: 10,),
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
                          if (selectedAnnouncement != null && selectedDate != null && selectedBatch !=null) {
                            setState(() {
                              tableData.add({
                                'announcement': "${selectedDate!} -> ${selectedAnnouncement!}",
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
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                      "Delete Data",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight: FontWeight.w900
                                                      ),
                                                    ),
                                                    content: const Text(
                                                      "Are you sure you want to delete this data?",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: const Text(
                                                          "NO",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.green
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            tableData.remove(data);
                                                          });
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: const Text(
                                                          "YES",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.red
                                                          ),
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
                                                      fontWeight: FontWeight.w600,
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
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                      "Delete Data",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight: FontWeight.w900
                                                      ),
                                                    ),
                                                    content: const Text(
                                                      "Are you sure you want to delete this data?",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: const Text(
                                                          "NO",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.green
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            tableData.remove(data);
                                                          });
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: const Text(
                                                          "YES",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.red
                                                          ),
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
                                                      fontWeight: FontWeight.w600,
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
