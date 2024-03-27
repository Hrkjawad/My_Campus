import 'package:flutter/material.dart';

void crList(BuildContext context) {
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
}