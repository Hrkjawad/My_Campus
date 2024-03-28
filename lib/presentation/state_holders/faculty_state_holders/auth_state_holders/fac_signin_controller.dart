import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/auth_models/fac_signin_model.dart';
import '../../../../data/models/network_response.dart';
import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';
import '../../auth_controller.dart';

class FacSignInController extends GetxController {
  bool _facSignInInProgress = false;
  String _message = '';
  String facEmail = '';
  FacSignInModel _facSignInModel = FacSignInModel();

  bool get facSignInInProgress => _facSignInInProgress;
  String get message => _message;
  FacSignInModel get facLoginModel => _facSignInModel;

  Future<bool> facSignIn(String email, String password) async {
    _facSignInInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.facultySignIn(email,password));
    _facSignInInProgress = false;
    update();
    if (response.isSuccess) {
      _facSignInModel = FacSignInModel.fromJson(response.responseJson!);
      await AuthController.setAccessToken(response.responseJson?['token']);
      _message = 'Signed In';
      return true;
    } else {
      _message = 'No user found. Try again!!';
      return false;
    }
  }
}
