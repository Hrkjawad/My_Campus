import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/auth_models/fac_profile_details_model.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import '../../../../data/models/network_response.dart';
import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';

class FacProfileDetailsController extends GetxController {
  bool _facProfileDetailsInProgress = false;
  //String _message = '';
  FacProfileDetailsData _facultyProfileDetailsData = FacProfileDetailsData();

  bool get facProfileDetailsInProgress => _facProfileDetailsInProgress;
  //String get message => _message;
  FacProfileDetailsData get facProfileDetailsData => _facultyProfileDetailsData;

  Future<bool> facSignIn(String email, String password) async {
    _facProfileDetailsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.facultyProfileDetails);

    update();
    if (response.isSuccess) {
      _facultyProfileDetailsData =
          FacProfileDetailsData.fromJson(response.responseJson!);
      // await AuthController.setProfileDetails(
      //     response.responseJson?['data']['email']);
      //_message = 'Signed In';

      return true;
    } else {
      //_message = 'No user found. Try again!!';
      return false;
    }
  }
}
