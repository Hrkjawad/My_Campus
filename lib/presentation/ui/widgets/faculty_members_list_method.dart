import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../state_holders/faculty_state_holders/fac_available_controller.dart';

void facultyMembers(BuildContext context, FacAvailableController facAvailableController) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SingleChildScrollView(
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
                  ),
                ],
              ),
            ),
            actions: [
              ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index){
                return  ListTile(
                  title: Text(facAvailableController.facAvailableModel.data![0].fullName.toString()),
                );
              })

            ],
          ),
        ),
      );
    },
  );
}
