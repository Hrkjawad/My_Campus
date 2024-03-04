import 'package:flutter/material.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/dropdown_button.dart';

class FacHomeScreen extends StatefulWidget {
  const FacHomeScreen({super.key});

  @override
  State<FacHomeScreen> createState() => _FacHomeScreenState();
}

String? selectedBatch;
String? selectedCourse;
List<Map<String, String>> tableData = [];
var scaffoldKey = GlobalKey<ScaffoldState>();

class _FacHomeScreenState extends State<FacHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.25,
        leading: IconButton(
          icon: const AppLogo(),
          onPressed: (){
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
        width: 250,
        backgroundColor: const Color(0xFFE0FFF1),
        child: ListView(
          children: [
            ListTile(
              title: const Text(
                'Batches CR Number',
                style: TextStyle(fontWeight: FontWeight.w600),
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
              title: const Text(
                'Bus Schedules',
                style: TextStyle(fontWeight: FontWeight.w600),
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
              title: const Text(
                'Faculty Numbers',
                style: TextStyle(fontWeight: FontWeight.w600),
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
              title: const Text(
                'Add Tasks',
                style: TextStyle(fontWeight: FontWeight.w600),
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
              title: const Text(
                'My ToDo',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              hoverColor: Colors.grey,
              onTap: () {},
            ),
            const Divider(
              color: Color(0xFF0D6858),
              height: 3,
              thickness: 1,
            ),
            const Text('V 1.0.0'),
          ],
        ),
      ),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 39,
              ),
              SizedBox(
                width: 292,
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
                  SizedBox(
                    width: 120,
                    height: 80,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(25),
                      child: Card(
                        color: const Color(0xFFACFFDC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 5,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'My',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Classes',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 120,
                    height: 80,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(25),
                      child: Card(
                        color: const Color(0xFFFFE8D2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 5,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Exam',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Routine',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 29,
              ),
              SizedBox(
                width: 292,
                height: 77,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (context, StateSetter setState){
                            return AlertDialog(
                              title: const Center(
                                child: Text(
                                  "SELECT BATCH & COURSES",
                                  style: TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.w900),
                                ),
                              ),
                              actions: [
                                CustomDropdownButton(
                                  items: ['57-A+B', '56-A', '56-B'],
                                  value: selectedBatch,
                                  hintText: 'Select Batch',
                                  onChanged: (value) {
                                    setState(() {
                                      selectedBatch = value;
                                    });
                                  },
                                ),
                                const SizedBox(width: 20),
                                CustomDropdownButton(
                                  items: ['CSE-1111', 'EEE-1111', 'CSE-3121'],
                                  value: selectedCourse,
                                  hintText: 'Select Course',
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCourse = value;
                                    });
                                  },
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
                                      if (selectedBatch != null &&
                                          selectedCourse != null) {
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
                                            color: const Color(0x999B9B9B)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
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
                                        rows: tableData.map((data) {
                                          return DataRow(
                                            cells: [
                                              DataCell(
                                                Text(
                                                  data['Batch']!,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 19,
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  data['Course']!,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 19,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                        });
                  },
                  borderRadius: BorderRadius.circular(25),
                  child: Card(
                    color: const Color(0xFFF8FFAC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 5,
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Batches & Courses',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              const SizedBox(
                width: double.infinity,
                height: 184,
                child: Card(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Announcements',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0D6858),
                      ),
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 27,
                backgroundColor: Colors.black,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
