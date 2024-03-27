import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_campus/presentation/state_holders/faculty_list_controller.dart';

void facultyMembers(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, StateSetter setState) {
          return SingleChildScrollView(
            child: GetBuilder<FacultyListController>(
                builder: (facultyListController) {
              if (facultyListController.facultyListInProgress) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                );
              }
              return AlertDialog(
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
                     Column(
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
                            facultyListController.facultyMember.name.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                letterSpacing: .6),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                facultyListController.facultyMember.designation.toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                facultyListController.facultyMember.department.toString(),
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
              );
            }),
          );
        },
      );
    },
  );
}
