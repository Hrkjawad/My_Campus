import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_list_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_signin_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_password_change_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_verify_otp_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_signup_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_verify_email_controller.dart';
import '../presentation/state_holders/faculty_state_holders/auth_state_holders/fac_availability_checking_controller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    //Get.put(FacRegistrationController());
    Get.put(FacAvailabilityCheckingController());
    Get.put(FacSignInController());
    Get.put(FacSignUpController());
    Get.put(FacVerifyEmailController());
    Get.put(FacVerifyOTPController());
    Get.put(FacPasswordChangeController());
    Get.put(FacultyListController());
  }
}
