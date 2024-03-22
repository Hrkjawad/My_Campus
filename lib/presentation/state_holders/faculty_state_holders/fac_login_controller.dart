import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_login_model.dart';
import '../../../data/models/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class FacLoginController extends GetxController {
  bool _facLoginInProgress = false;
  String _message = '';
  FacLoginModel _facLoginModel = FacLoginModel();

  bool get facLoginInProgress => _facLoginInProgress;
  String get message => _message;
  FacLoginModel get facLoginModel => _facLoginModel;

  Future<bool> facLogin(String email) async {
    _facLoginInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.facultyLogin, {
      "email": email,
    });
    _facLoginInProgress = false;
    if (response.isSuccess) {
      _facLoginModel = FacLoginModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = _facLoginModel.status!;
      return false;
    }
  }
}