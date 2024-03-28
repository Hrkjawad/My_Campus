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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () =>  (home),
                    );
                  },
                  child: Icon(
                    Icons.home,
                    size: ScreenUtil().setSp(30),
                    color: Colors.green,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.to(
                    //   () =>  (mytodo),
                    // );
                  },
                  child: Icon(
                    Icons.mark_unread_chat_alt_rounded,
                    size: ScreenUtil().setSp(30),
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const FileUpload(),
                    );
                  },
                  child: Icon(
                    Icons.my_library_books_rounded,
                    size: ScreenUtil().setSp(30),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 42.w,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                  SizedBox(
                    width: 95.w,
                  ),
                  Text(
                    "Chat",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                  SizedBox(
                    width: 85.w,
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
      ),
    );
  }
}
