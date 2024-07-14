import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void facultyMembers(BuildContext context) {
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
                title: Center(
                  child: Column(
                    children: [
                      Text(
                        "Faculty",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(26),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(6),
                      ),
                      const LinearProgressIndicator(
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
                              size: ScreenUtil().setWidth(35),
                              color: Colors.blueGrey,
                            ),
                          ),
                          title: Text(
                            'Md Ebrahim Hossain',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: ScreenUtil().setSp(20),
                                letterSpacing: .6),
                          ),
                          subtitle: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: ScreenUtil().setHeight(6),
                              ),
                              Text(
                                'Assistant Professor',
                                style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(8),
                              ),
                              Text(
                                'CSE Department',
                                style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(8),
                              ),
                              Text(
                                'Email: ebh@lus.ac.bd',
                                style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(8),
                              ),
                              Text(
                                'Call: 01812-848136',
                                style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: ScreenUtil().setWidth(3),
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
