import 'package:get/get.dart';
import '../../../../data/models/network_response.dart';
import '../../../../data/models/stu_model/auth_models/stu_login_model.dart';
import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';
import '../../auth_controller.dart';

class StuSignInController extends GetxController {
  bool _stuSignInInProgress = false;
  String _message = '';
  StuSignInModel _stuSignInModel = StuSignInModel();

  bool get stuSignInInProgress => _stuSignInInProgress;
  String get message => _message;
  StuSignInModel get facLoginModel => _stuSignInModel;

  Future<bool> stuSignIn(String email, String password) async {
    _stuSignInInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.studentSignIn, {
      "email": email,
      "password": password,
    });
    _stuSignInInProgress = false;
    update();
    if (response.isSuccess) {
      _stuSignInModel = StuSignInModel.fromJson(response.responseJson!);
      await AuthController.setAccessToken(response.responseJson?['token']);
      _message = 'Signed In';
      return true;
    } else {
      _message = 'No user found. Try again!!';
      return false;
    }
  }
}
