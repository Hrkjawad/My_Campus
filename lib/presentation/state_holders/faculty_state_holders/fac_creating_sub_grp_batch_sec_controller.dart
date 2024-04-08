import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_sub_grp_batch_sec_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';

import '../../../data/utility/urls.dart';

class FacCreatingSubGrpBatchSecController extends GetxController {
  bool _facCreatingSubGrpBatchSecInProgress = false;
  String _message = '';
  FacultyCreatingSubGrpBatchSecData _facultyCreatingSubGrpBatchSecData =
      FacultyCreatingSubGrpBatchSecData();

  bool get facCreatingSubGrpBatchSecInProgress =>
      _facCreatingSubGrpBatchSecInProgress;

  String get message => _message;

  FacultyCreatingSubGrpBatchSecData get facCreatingSubGrpBatchSecData =>
      _facultyCreatingSubGrpBatchSecData;

  Future<bool> facCreatingSubGrpBatchSec(
      String batch, section, courseCode, courseTitle, id) async {
    _facCreatingSubGrpBatchSecInProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.facultySubGrpBatchSec(id),
      {
        "batch": batch,
        "section": section,
        "courseCode": courseCode,
        "courseTitle": courseTitle,
      },
    );
    _facCreatingSubGrpBatchSecInProgress = false;
    update();

    if (response.isSuccess) {
      _facultyCreatingSubGrpBatchSecData =
          FacultyCreatingSubGrpBatchSecModel.fromJson(response.responseJson!)
              .data!;
      _message = 'Added';
      return true;
    } else {
      _message = "Couldn't add!!";
      return false;
    }
  }
}
