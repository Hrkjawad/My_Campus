/*
import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_show_chats_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacShowChatsController extends GetxController {
  bool _inProgress = false;
  FacShowChatModel _facShowChatModel = FacShowChatModel();
  FacChatData _facChatData = FacChatData();
  List<FacChatData>? _facChatDataList;
  Chat _chat = Chat();
  List<Chat>? _chatList;

  bool get inProgress => _inProgress;
  FacShowChatModel get facShowChatModel => _facShowChatModel;
  FacChatData get facChatData => _facChatData;
  List<FacChatData>? get facChatDataList => _facChatDataList;
  Chat get chat => _chat;
  List<Chat>? get chatList => _chatList;

  Future<bool> facShowChats(String id) async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.facultyShowChats(id));
    _inProgress = false;
    update();

    if (response.isSuccess) {
      */
/*_facShowChatModel = FacShowChatModel.fromJson(response.responseJson!);
      _facChatData = FacChatData.fromJson(response.responseJson!);
      _chat = Chat.fromJson(response.responseJson!);*/ /*

      dynamic responseData =
          FacShowChatModel.fromJson(response.responseJson!).data;
      //dynamic responseData = FacChatData.fromJson(response.responseJson!).chat;
      if (responseData is List) {
        _facChatDataList = responseData.cast<FacChatData>();
      }
      if (responseData is List) {
        _chatList = responseData.cast<Chat>();
      }
      return true;
    } else {
      return false;
    }
  }
}
*/

import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_show_chats_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacShowChatsController extends GetxController {
  bool _inProgress = false;
  FacShowChatModel _facShowChatModel = FacShowChatModel();
  List<FacChatData> _facChatDataList = [];
  List<Chat> _chatList = [];

  bool get inProgress => _inProgress;
  FacShowChatModel get facShowChatModel => _facShowChatModel;
  List<FacChatData> get facChatDataList => _facChatDataList;
  List<Chat> get chatList => _chatList;

  Future<bool> facShowChats(String id) async {
    _inProgress = true;
    update();

    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.facultyShowChats(id));

    _inProgress = false;
    update();

    if (response.isSuccess) {
      _facShowChatModel = FacShowChatModel.fromJson(response.responseJson!);
      _facChatDataList = _facShowChatModel.data ?? [];

      // Extract all chat messages from all faculty data
      _chatList = _facChatDataList
          .expand<Chat>((facChatData) => facChatData.chat ?? [])
          .toList();

      update();
      return true;
    } else {
      return false;
    }
  }
}
