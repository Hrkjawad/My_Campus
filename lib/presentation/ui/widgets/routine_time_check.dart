import 'dart:async';
import 'package:get/get.dart';

class TimeManager extends GetxController {
  static const timeList = [
    '8:55 - AM',
    '9:50 - AM',
    '10:45 - AM',
    '11:40 - AM',
    '12:35 - PM',
    '11:06 - PM',
    "1:30 - PM",
    "2:15 - PM",
    "3:10 - PM",
    'No class'
  ];

  var currentClassTime = 'No class'.obs;

  void startUpdating() {
    updateClassTime();

    Timer.periodic(const Duration(minutes: 55), (timer) {
      updateClassTime();
    });
  }

  void updateClassTime() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    int currentMinute = now.minute;

    // Check if it's before 8:55 AM or after 3:55 PM, stop updating
    if (currentHour < 8 || (currentHour == 15 && currentMinute >= 55) || currentHour > 15) {
      currentClassTime.value = 'No class';
      print('No class due to time constraints');
      return;
    }

    int hour12 = currentHour > 12 ? currentHour - 12 : currentHour;
    if (hour12 == 0) {
      hour12 = 12;
    }

    String period = currentHour < 12 ? 'AM' : 'PM';
    String currentTime = '$hour12:${currentMinute.toString().padLeft(2, '0')} - $period';


    print('Current time: $currentTime');

    int index = timeList.indexOf(currentTime);

    if (index == -1) {
      index = 8;
    }

    currentClassTime.value = timeList[index];

    print('Updated current class time to: ${currentClassTime.value}');
  }
}
