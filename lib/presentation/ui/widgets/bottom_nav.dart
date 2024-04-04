import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'file_upload.dart';

class BottomNav extends StatelessWidget {
  final Widget home;

  const BottomNav({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 10.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => home);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        size: 30.w,
                        color: Colors.green,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle onTap for chat
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.mark_unread_chat_alt_rounded,
                        size: 30.w,
                        color: Colors.blue,
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const FileUpload());
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.my_library_books_rounded,
                        size: 30.w,
                        color: Colors.red,
                      ),
                      Text(
                        "Resources",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
