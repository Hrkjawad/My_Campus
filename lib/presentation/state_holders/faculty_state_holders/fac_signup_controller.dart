import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_password_change_model.dart';
import '../../../data/models/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class FacSignupController extends GetxController {
  bool _facSignupInProgress = false;
  String _message = '';
  FacSignupModel _facSignupModel = FacSignupModel();

  bool get facSignupInProgress => _facSignupInProgress;
  String get message => _message;
  FacSignupModel get facSignupModel => _facSignupModel;

  Future<bool> facSignup(String password) async {
    _facSignupInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.facultyPassChange, {
      "password": password,
    });
    _facSignupInProgress = false;
    update();
    if (response.isSuccess) {
      _facSignupModel = FacSignupModel.fromJson(response.responseJson!);
      _message = 'Sign up completed';
      return true;
    } else {
      _message = 'Sign up could not be completed!!';

      return false;
    }
  }
}
