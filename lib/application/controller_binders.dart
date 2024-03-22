import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_login_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_main_bottom_nav_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_registration_controller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(() => FacMainBottomNavController());
    //Get.put(() => FacAvailabilityCheckingController());
    Get.put(FacRegistrationController());
    Get.put(FacLoginController());
  }
}
