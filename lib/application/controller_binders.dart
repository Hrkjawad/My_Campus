import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_main_bottom_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_my_todo_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_signin_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_password_change_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_verify_otp_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_signup_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_verify_email_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_show_chats_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/auth_state_holders/stu_availability_checking_controller.dart';
import '../presentation/state_holders/faculty_state_holders/auth_state_holders/fac_availability_checking_controller.dart';
import '../presentation/state_holders/faculty_state_holders/fac_creating_sub_grp_batch_sec_controller.dart';
import '../presentation/state_holders/faculty_state_holders/fac_resource_controller.dart';
import '../presentation/state_holders/faculty_state_holders/fac_show_group_batch_section_course_controller.dart';
import '../presentation/state_holders/faculty_state_holders/group_chatting_controller.dart';
import '../presentation/state_holders/student_state_holders/auth_state_holders/stu_password_change_controller.dart';
import '../presentation/state_holders/student_state_holders/auth_state_holders/stu_signin_controller.dart';
import '../presentation/state_holders/student_state_holders/auth_state_holders/stu_signup_controller.dart';
import '../presentation/state_holders/student_state_holders/auth_state_holders/stu_verify_email_controller.dart';
import '../presentation/state_holders/student_state_holders/auth_state_holders/stu_verify_otp_controller.dart';

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
    Get.put(FacAnnouncementController());
    Get.put(FacMyToDoController());
    Get.put(FacCreatingSubGrpBatchSecController());
    Get.put(FacShowGroupBatchSectionCourseController());
    Get.put(FacMainBottomNavController());
    Get.put(GroupChattingController());
    Get.put(FacResourceController());
    Get.put(FacShowChatsController());

    Get.put(StuAvailabilityCheckingController());
    Get.put(StuSignInController());
    Get.put(StuSignUpController());
    Get.put(StuVerifyEmailController());
    Get.put(StuVerifyOTPController());
    Get.put(StuPasswordChangeController());
  }
}
