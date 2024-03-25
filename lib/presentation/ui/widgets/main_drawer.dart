import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/faculty_state_holders/fac_main_bottom_nav_controller.dart';
Drawer facultyDrawer(BuildContext context) {
  return Drawer(
    width: 286,
    backgroundColor: const Color(0xFFE0FFF1),
    child: ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: const Center(
            child: Text(
              'Departments CR',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
            ),
          ),
          hoverColor: Colors.grey,
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: StatefulBuilder(
                    builder: (context, StateSetter setState) {
                      return SingleChildScrollView(
                        child: AlertDialog(
                          title: const Center(
                            child: Column(
                              children: [
                                Text(
                                  "Batch CR",
                                  style: TextStyle(
                                    fontSize: 26,
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
                                      'Hasin Israq',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20,
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
                                          'CSE Department',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Batch Name',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Mobile Number',
                                          style: TextStyle(fontSize: 18),
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
                  ),
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
                            height: 400,
                            width: 400,
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
              'Departments Faculty',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
            ),
          ),
          hoverColor: Colors.grey,
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: StatefulBuilder(
                    builder: (context, StateSetter setState) {
                      return SingleChildScrollView(
                        child: AlertDialog(
                          title: const Center(
                            child: Column(
                              children: [
                                Text(
                                  "Faculty",
                                  style: TextStyle(
                                    fontSize: 26,
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
                                          fontSize: 20,
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
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'CSE Department',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Email: prb@lus.ac.bd',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Mobile Number',
                                          style: TextStyle(fontSize: 18),
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
                  ),
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
  );
}