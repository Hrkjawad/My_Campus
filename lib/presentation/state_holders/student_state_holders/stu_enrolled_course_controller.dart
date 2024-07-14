import 'package:get/get.dart';
import 'package:my_campus/data/models/stu_model/enrolled_course_model.dart';

import '../../../data/models/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class StuEnrolledCourseController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  EnrolledCourseModel _enrolledCourseModel = EnrolledCourseModel();

  bool get inProgress => _inProgress;

  String get message => _message;

  EnrolledCourseModel get enrolledCourseModel => _enrolledCourseModel;

  Future<bool> enrolledCourses(String stuName) async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.stuEnrolledCourses(stuName));
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _enrolledCourseModel =
          EnrolledCourseModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }
}
