import 'package:get/get.dart';

import '../../../data/models/faculty_model/fac_show_announcement_model.dart';
import 'fac_announcement_controller.dart';

class FacAnnouncementListenController extends GetxController {
  List<String?> announcements = [];

  why() async {
    await Get.find<FacAnnouncementController>().facShowAnnouncement();
    FacShowAnnouncementModel model = Get.find<FacAnnouncementController>().facShowAnnouncementModel;

    if (model.data != null) {
      for (var item in model.data!) {
        announcements.add('${item.announcement} \nBatch: ${item.batch} \nDate: ${item.date}');
      }
    }
    update();
  }
}
