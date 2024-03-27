import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/teacher_add_tasks.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/teacher_my_todo.dart';
import 'package:my_campus/presentation/ui/widgets/faculty_members_list_method.dart';

import 'cr_list_method.dart';

Drawer customisedFacultyDrawer(BuildContext context) {
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
            crList(context);
          },
        ),
        divider(),
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
                return SizedBox(
                  width: 500,
                  height: 300,
                  child: AlertDialog(
                    title: const Center(
                      child: Text(
                        "Bus Schedules",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    content: InteractiveViewer(
                      boundaryMargin: const EdgeInsets.all(20),
                      minScale: 0.1,
                      maxScale: 6.0,
                      child: Image.asset(
                        height: 300,
                        width: 500,
                        'assets/images/Bus Time.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        divider(),
        ListTile(
          title: const Center(
            child: Text(
              'Departments Faculty',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
            ),
          ),
          hoverColor: Colors.grey,
          onTap: () {
            facultyMembers(context);
          },
        ),
        divider(),
        ListTile(
          title: const Center(
            child: Text(
              'Add Tasks',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
            ),
          ),
          hoverColor: Colors.grey,
          onTap: () {
            Get.to(
              () => const FacAddTask(),
            );
          },
        ),
        divider(),
        ListTile(
          title: const Center(
            child: Text(
              'My ToDo',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
            ),
          ),
          hoverColor: Colors.grey,
          onTap: () {
            Get.to(
              () => const FacMyTodo(),
            );
          },
        ),
        divider(),
        const SizedBox(height: 480),
        const Center(
          child: Text(
            'Version 1.0',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

Divider divider() {
  return const Divider(
    color: Color(0xFF0D6858),
    height: 3,
    thickness: 1,
  );
}
