import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_login_model.dart';
import '../../../data/models/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utility/urls.dart';
import '../auth_controller.dart';

class FacLoginController extends GetxController {
  bool _facLoginInProgress = false;
  String _message = '';
  FacLoginModel _facLoginModel = FacLoginModel();

  bool get facLoginInProgress => _facLoginInProgress;
  String get message => _message;
  FacLoginModel get facLoginModel => _facLoginModel;

  Future<bool> facLogin(String email, String password) async {
    _facLoginInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.facultyLogin, {
      "email": email,
      "password": password,
    });
    _facLoginInProgress = false;
    update();
    if (response.isSuccess) {
      _facLoginModel = FacLoginModel.fromJson(response.responseJson!);
      await AuthController.setAccessToken(response.responseJson?['token']);
      _message = 'Logged In';
      return true;
    } else {
      _message = 'Could not log in!!';
      return false;
    }
  }
}
