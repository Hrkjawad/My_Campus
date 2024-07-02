import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  const Date({super.key});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var formattedDate = DateFormat.yMMMMd().format(date);
    return Text(
      'Today: $formattedDate',
      style:  TextStyle(
          fontWeight: FontWeight.w500, color: Colors.redAccent, fontSize: 18.sp),
    );
  }
}
