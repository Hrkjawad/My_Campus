import 'package:get/get.dart';

class FacMainBottomNavController extends GetxController {
  int currentSelectedIndex = 0;

  void changeScreen(int index) {
    currentSelectedIndex = index;
    update();
  }

  void backHome() {
    changeScreen(0);
  }
}