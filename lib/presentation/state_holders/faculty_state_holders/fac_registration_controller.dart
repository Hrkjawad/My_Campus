import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_registration_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class FacRegistrationController extends GetxController {
  bool _facRegInProgress = false;
  String _message = '';
  FacRegData _facRegData = FacRegData();

  bool get facRegInProgress => _facRegInProgress;
  String get message => _message;
  FacRegData get facRegData => _facRegData;

  Future<bool> facReg(String email) async {
    _facRegInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.facultyReg,
      {"email": email},
    );
    _facRegInProgress = false;
    if (response.isSuccess) {
      _facRegData =
          FacRegistrationModel.fromJson(response.responseJson ?? {}).data!;
      return true;
    } else {
      _message = 'Failed to create profile';
      return false;
    }
  }
}
