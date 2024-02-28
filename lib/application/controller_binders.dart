import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_main_bottom_nav_controller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(() => FacMainBottomNavController());
  }
}
