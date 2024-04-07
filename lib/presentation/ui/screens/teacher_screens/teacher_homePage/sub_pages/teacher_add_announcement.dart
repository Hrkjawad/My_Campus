import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_announcement_controller.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../widgets/appbar_method.dart';
import '../../../../widgets/date_select.dart';
import '../../../../widgets/dropdown_button.dart';
import '../../../../widgets/fac_drawer_method.dart';
import '../../../../widgets/text_fields.dart';

class TeacherAddAnnouncement extends StatefulWidget {
  const TeacherAddAnnouncement({super.key});

  @override
  State<TeacherAddAnnouncement> createState() => _TeacherAddAnnouncementState();
}

class _TeacherAddAnnouncementState extends State<TeacherAddAnnouncement> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  String? selectedDate, selectedAnnouncement, selectedBatch, selectedSection;

  TextEditingController dateInput = TextEditingController();
  final TextEditingController _taskTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<FacAnnouncementController>().facAnnouncementModel.data;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 15.h,
                        left: 20.w,
                        child: Container(
                          width: 380.w,
                          height: 320.h,
                          decoration: BoxDecoration(
                            color: const Color(0xBBB2FF9E),
                            border: Border.all(
                              color: const Color(0x999B9B9B),
                            ),
                            borderRadius: BorderRadius.circular(20.w),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 23.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  controller: _taskTEController,
                                  hintText: 'Type Announcement',
                                  height: 45.h,
                                  width: 360.w,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomDropdownButton(
                                  width: 360.w,
                                  height: 45.h,
                                  dropDownWidth: 360.w,
                                  items: const ['56', '57', '58'],
                                  value: selectedBatch,
                                  hintText: 'Select Batch',
                                  onChanged: (value) {
                                    setState(() {
                                      selectedBatch = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomDropdownButton(
                                  width: 360.w,
                                  height: 45.h,
                                  dropDownWidth: 360.w,
                                  items: const ['A', 'B', 'C'],
                                  value: selectedSection,
                                  hintText: 'Select Section',
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSection = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomDatePicker(
                                  controller: dateInput,
                                  width: 360.w,
                                  height: 45.h,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDate = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 360,
                              height: 55,
                              child: GetBuilder<FacAnnouncementController>(
                                builder: (facAnnouncementController) {
                                  if (facAnnouncementController
                                      .facAnnouncementInProgress) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.teal,
                                      ),
                                    );
                                  }
                                  return ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate() &&
                                          selectedBatch != null &&
                                          selectedSection != null &&
                                          selectedDate != null) {
                                        facAddAnnouncement(
                                            facAnnouncementController);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFF8FFAC),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0.w),
                                        side: const BorderSide(
                                          color: Color(0x999B9B9B),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'ADD',
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0.w, left: 20.0.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Batch',
                              style: TextStyle(
                                color: const Color(0xFF0D6858),
                                fontWeight: FontWeight.w500,
                                fontSize: 26.sp,
                              ),
                            ),
                            Text(
                              'Announcements',
                              style: TextStyle(
                                color: const Color(0xFF0D6858),
                                fontWeight: FontWeight.w500,
                                fontSize: 26.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GetBuilder<FacAnnouncementController>(
                            builder: (facAnnouncementController) {
                          return SizedBox(
                            height: 400,
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              reverse: true,
                              itemCount: facAnnouncementController
                                      .facAnnouncementModel.data?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Text(
                                      '${facAnnouncementController.facAnnouncementModel.data![index].batch!} ${facAnnouncementController.facAnnouncementModel.data![index].batch!}',
                                      style: TextStyle(
                                        color: const Color(0xFF0D6858),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30.w,
                                    ),
                                    Text(
                                      '${facAnnouncementController.facAnnouncementModel.data![index].announcement!} \nDate: ${facAnnouncementController.facAnnouncementModel.data![index].announcement!}',
                                      style: TextStyle(
                                        color: const Color(0xFF0D6858),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.sp,
                                        height: 2,
                                      ),
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> facAddAnnouncement(
      FacAnnouncementController facAnnouncementController) async {
    final result = await facAnnouncementController.facAnnouncement(
      _taskTEController.text.trim(),
      selectedBatch.toString(),
      selectedBatch.toString(),
      selectedDate.toString(),
    );
    if (result) {
      Get.snackbar('Successful!', 'Announcement has been added');
      selectedBatch = null;
      selectedSection = null;
      dateInput.clear();
      _taskTEController.clear();
    } else {
      Get.snackbar('Failed!', "Couldn't add announcement!!",
          colorText: Colors.redAccent);
    }
  }
}
