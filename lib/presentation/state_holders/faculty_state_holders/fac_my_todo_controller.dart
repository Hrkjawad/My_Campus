import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_delete_my_todo_model.dart';
import 'package:my_campus/data/models/faculty_model/fac_my_todo_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class FacMyToDOController extends GetxController {
  bool _facMyToDoInProgress = false;
  String _message = '';
  FacMyToDoModel _facMyToDoModel = FacMyToDoModel();
  FacDeleteMyToDoModel _facDeleteMyToDoModel = FacDeleteMyToDoModel();

  bool get facMyToDoInProgress => _facMyToDoInProgress;
  String get message => _message;
  FacMyToDoModel get facMyToDoModel => _facMyToDoModel;
  FacDeleteMyToDoModel get facDeleteMyToDoModel => _facDeleteMyToDoModel;

  Future<bool> facMyToDo(String todo, date) async {
    _facMyToDoInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyMyToDo(todo, date),
    );
    _facMyToDoInProgress = false;
    update();
    if (response.isSuccess) {
      _facMyToDoModel = FacMyToDoModel.fromJson(response.responseJson!);
      //_message = 'Todo added';
      return true;
    } else {
      //_message = "Couldn't add todo";
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
