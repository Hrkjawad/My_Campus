import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_add_task_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class FacAddTaskController extends GetxController {
  bool _facAddTaskInProgress = false;
  String _message = '';
  FacAddTaskData _facAddTaskData = FacAddTaskData();
  FacAddTaskModel _facAddTaskModel = FacAddTaskModel();

  bool get facAddTaskInProgress => _facAddTaskInProgress;
  String get message => _message;
  FacAddTaskModel get facAddTaskModel => _facAddTaskModel;
  FacAddTaskData get facAddTaskData => _facAddTaskData;

  Future<bool> facAddTask(String batch, section, courseTitle, task) async {
    _facAddTaskInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyAddTask(batch, section, courseTitle, task),
    );
    _facAddTaskInProgress = false;
    update();
    if (response.isSuccess) {
      _facAddTaskModel = FacAddTaskModel.fromJson(response.responseJson!);
      // _facAddTaskData= FacAddTaskModel.fromJson(response.responseJson!).data!;
      _message = 'Task added';
      return true;
    } else {
      _message = "Couldn't added task!!";
      return false;
    }
  }
}
