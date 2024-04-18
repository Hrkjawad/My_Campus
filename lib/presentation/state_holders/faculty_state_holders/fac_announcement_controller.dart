import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_add_announcement_model.dart';
import 'package:my_campus/data/models/faculty_model/fac_show_announcement_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class FacAnnouncementController extends GetxController {
  bool _facAnnouncementInProgress = false;
  FacAddAnnouncementModel _facAddAnnouncementModel = FacAddAnnouncementModel();
  FacShowAnnouncementModel _facShowAnnouncementModel =
      FacShowAnnouncementModel();

  bool get facAnnouncementInProgress => _facAnnouncementInProgress;
  FacAddAnnouncementModel get facAddAnnouncementModel =>
      _facAddAnnouncementModel;
  FacShowAnnouncementModel get facShowAnnouncementModel =>
      _facShowAnnouncementModel;

  Future<bool> facAddAnnouncement(String task, batch, section, date) async {
    _facAnnouncementInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.facultyAddAnnouncement,
      {
        "announcement": task,
        "batch": batch.toString(),
        "section": section.toString(),
        "date": date.toString(),
      },
    );
    _facAnnouncementInProgress = false;
    update();

    if (response.isSuccess) {
      _facAddAnnouncementModel =
          FacAddAnnouncementModel.fromJson(response.responseJson ?? {});
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> facShowAnnouncement() async {
    _facAnnouncementInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyShowAnnouncement,
    );
    _facAnnouncementInProgress = false;
    update();

    if (response.isSuccess) {
      _facShowAnnouncementModel =
          FacShowAnnouncementModel.fromJson(response.responseJson ?? {});
      return true;
    } else {
      update();
      return false;
    }
  }
}
