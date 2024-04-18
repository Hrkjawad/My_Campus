import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_delete_my_todo_model.dart';
import 'package:my_campus/data/models/faculty_model/fac_add_my_todo_model.dart';
import 'package:my_campus/data/models/faculty_model/fac_show_my_todo_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class FacMyToDoController extends GetxController {
  bool _facMyToDoInProgress = false;
  //String _message = '';
  FacAddMyToDoModel _facAddMyToDoModel = FacAddMyToDoModel();
  FacShowMyToDoModel _facShowMyToDoModel = FacShowMyToDoModel();
  FacDeleteMyToDoModel _facDeleteMyToDoModel = FacDeleteMyToDoModel();

  bool get facMyToDoInProgress => _facMyToDoInProgress;
  //String get message => _message;
  FacAddMyToDoModel get facAddMyToDoModel => _facAddMyToDoModel;
  FacShowMyToDoModel get facShowMyToDoModel => _facShowMyToDoModel;
  FacDeleteMyToDoModel get facDeleteMyToDoModel => _facDeleteMyToDoModel;

  Future<bool> facAddMyToDo(String todo, date) async {
    _facMyToDoInProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.postRequest(Urls.facultyAddMyToDo, {
      "title": todo,
      "date": date,
    });
    _facMyToDoInProgress = false;
    update();
    if (response.isSuccess) {
      _facAddMyToDoModel = FacAddMyToDoModel.fromJson(response.responseJson!);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> facShowMyToDo() async {
    _facMyToDoInProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.facultyShowMyToDo);
    _facMyToDoInProgress = false;
    update();
    if (response.isSuccess) {
      _facShowMyToDoModel = FacShowMyToDoModel.fromJson(response.responseJson!);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> facDeleteMyToDo(String id) async {
    _facMyToDoInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyDeleteMyToDo(id),
    );
    _facMyToDoInProgress = false;
    update();
    if (response.isSuccess) {
      _facDeleteMyToDoModel =
          FacDeleteMyToDoModel.fromJson(response.responseJson!);
      return true;
    } else {
      return false;
    }
  }
}
