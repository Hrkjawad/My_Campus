import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/fac_home_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/teacher_add_announcement.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/teacher_homePage/sub_pages/teacher_my_todo.dart';

class FacBottomNavScreen extends StatelessWidget {
  const FacBottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                          () => const FacHomeScreen(),
                    );
                  },
                  child: const Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.green,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                          () => const FacMyTodo(),
                    );
                  },
                  child: const Icon(
                    Icons.mark_unread_chat_alt_rounded,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                          () => const TeacherAddAnnouncement(),
                    );
                  },
                  child: const Icon(
                    Icons.my_library_books_rounded,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 37,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(
                    width: 85,
                  ),
                  Text(
                    "Chat",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "Resources",
                    style: TextStyle(fontSize: 16, color: Colors.black),
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
