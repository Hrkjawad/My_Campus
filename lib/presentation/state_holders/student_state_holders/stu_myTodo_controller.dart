import 'package:get/get.dart';
import 'package:my_campus/data/models/stu_model/batch_announcement_model.dart';

import '../../../data/models/network_response.dart';
import '../../../data/models/stu_model/stu_show_myTodo_model.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class StuMyTodoController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  ShowStuTodoModel _stuMyShowMyTodoModel = ShowStuTodoModel();

  bool get inProgress => _inProgress;

  String get message => _message;

  ShowStuTodoModel get stuMyShowMyTodoModel => _stuMyShowMyTodoModel;

  Future<bool> stuAddMyTodo(String taskTitle, String date) async {
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.postRequest(
        Urls.stuAddMyTodo,
        {"title": taskTitle.toString(), "date": date.toString()});
    _inProgress = false;
    update();
    if (response.isSuccess) {

      _stuMyShowMyTodoModel = ShowStuTodoModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }

  Future<bool> stuShowMyTodo() async {
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.showStuTodo);
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _stuMyShowMyTodoModel = ShowStuTodoModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }
}
