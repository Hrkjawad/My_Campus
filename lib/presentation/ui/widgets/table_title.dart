import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableTitle extends StatelessWidget {
  const TableTitle({
    super.key,
    required this.title1,
    required this.title2,
  });
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 26.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title1,
              style: TextStyle(
                color: const Color(0xFF0D6858),
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            Text(
              title2,
              style: TextStyle(
                color: const Color(0xFF0D6858),
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            )
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
