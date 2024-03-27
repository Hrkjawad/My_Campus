import 'package:flutter/material.dart';
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
      formattedDate,
      style: const TextStyle(
          fontWeight: FontWeight.w400, color: Colors.red, fontSize: 18),
    );
  }
}
