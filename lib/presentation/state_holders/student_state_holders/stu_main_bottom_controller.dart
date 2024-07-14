import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_announcement_listen_controller.dart';

class StuMainBottomNavController extends GetxController {
  int currentSelectedScreen = 0;

  Future<void> changeScreen(int index) async{
    currentSelectedScreen = index;
    update();
  }

  void backToHome() {
    changeScreen(0);
  }
}
