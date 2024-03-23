import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/auth_models/fac_login_model.dart';
import '../../../data/models/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utility/urls.dart';
import '../auth_controller.dart';

class FacAvailabilityCheckingController extends GetxController {
  bool _facAvailabilityCheckingInProgress = false;
  String _message = '';
  FacLoginModel _facLoginModel = FacLoginModel();

  bool get facAvailabilityCheckingProgress =>
      _facAvailabilityCheckingInProgress;
  String get message => _message;
  FacLoginModel get facLoginModel => _facLoginModel;

  Future<bool> facAvailabilityCheck(String email) async {
    _facAvailabilityCheckingInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.facultyLogin, {
      "email": email,
    });
    _facAvailabilityCheckingInProgress = false;
    update();
    if (response.isSuccess) {
      _facLoginModel = FacLoginModel.fromJson(response.responseJson!);
      await AuthController.setAccessToken(response.responseJson?['token']);
      _message = 'OTP has been sent to this email address';
      return true;
    } else {
      _message = 'Email is not found in database!!';
      return false;
    }
  }
}
