import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/stu_announcement_listen_controller.dart';

class StuMainBottomNavController extends GetxController {
  int currentSelectedScreen = 0;

  Future<void> changeScreen(int index) async{
    Get.find<StuAnnouncementListenController>().announcements;
    currentSelectedScreen = index;
    update();
  }

  void backToHome() {
    changeScreen(0);
  }
}
