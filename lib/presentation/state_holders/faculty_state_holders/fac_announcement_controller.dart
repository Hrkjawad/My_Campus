import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_announcement_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class FacAnnouncementController extends GetxController {
  bool _facAnnouncementInProgress = false;
  FacAnnouncementModel _facAnnouncementModel = FacAnnouncementModel();

  FacAnnouncementModel get facAnnouncementModel => _facAnnouncementModel;
  bool get facAnnouncementInProgress => _facAnnouncementInProgress;

  Future<bool> facAnnouncement(String task, batch) async {
    _facAnnouncementInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyAnnouncement(task, batch),
    );
    _facAnnouncementInProgress = false;
    update();

    if (response.isSuccess) {
      _facAnnouncementModel =
          FacAnnouncementModel.fromJson(response.responseJson ?? {});
      return true;
    } else {
      update();
      return false;
    }
  }
}
