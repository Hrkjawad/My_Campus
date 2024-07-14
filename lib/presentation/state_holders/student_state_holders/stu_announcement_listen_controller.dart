import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/batch_all_announcement_controller.dart';

import '../../../data/models/stu_model/batch_announcement_model.dart';

class StuAnnouncementListenController extends GetxController {
  List<String?> announcements = [];

  why() async {
    await Get.find<BatchAllAnnouncementController>()
        .batchAllAnnouncement('57 A+B');
    BatchAnnouncementModel model =
        Get.find<BatchAllAnnouncementController>().batchAnnouncementModel;

    print('hi announcement');
    if (model.data != null) {
      for (var item in model.data!) {
        announcements.add('${item.type} | Date: ${item.date}');
      }
    }
    update();
  }
}
