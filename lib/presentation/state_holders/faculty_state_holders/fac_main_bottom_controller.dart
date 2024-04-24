import 'package:get/get.dart';

import 'fac_show_group_batch_section_course_controller.dart';

class FacMainBottomNavController extends GetxController {
  int currentSelectedScreen = 0;
  final List<Map<String, String>> batchCoursePairs = [];

  Future<void> changeScreen(int index) async {
    if (index == 1) {
      await Get.find<FacShowGroupBatchSectionCourseController>().showGroups();

      final dataList = Get.find<FacShowGroupBatchSectionCourseController>()
          .facultyCreatingSubGrpBatchSecDataList;

      for (final data in dataList!) {
        final a = data.batch!;
        final b = data.courseCode!;
        final c = data.courseTitle!;
        batchCoursePairs.add({'batch': a, 'courseCode': b, 'courseTitle': c});
      }
      currentSelectedScreen = index;
      update();
    }  else {
      currentSelectedScreen = index;
      batchCoursePairs.clear();
      update();
    }
  }

  void backToHome() {
    changeScreen(0);
  }
}
