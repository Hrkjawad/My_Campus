import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_show_chats_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacShowChatsController extends GetxController {
  bool _inProgress = false;

  FacShowChatModel _facShowChatModel = FacShowChatModel();
  FacChatData _facChatData = FacChatData();

  bool get inProgress => _inProgress;
  FacShowChatModel get facShowChatModel => _facShowChatModel;
  FacChatData get facChatData => _facChatData;

  Future<bool> facShowChats() async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.facultyShowChats);
    _inProgress = false;
    update();

    if (response.isSuccess) {
      //_facShowChatModel = FacShowChatModel.fromJson(response.responseJson!);
      _facChatData = FacChatData.fromJson(response.responseJson!);
      return true;
    } else {
      return false;
    }
  }
}
