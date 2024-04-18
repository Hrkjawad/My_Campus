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
      Get.find<FacAnnouncementController>().facShowAnnouncement();
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
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
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
                                          if (_formKey.currentState!
                                                  .validate() &&
                                              selectedBatch != null &&
                                              selectedSection != null &&
                                              selectedDate != null) {
                                            facAddAnnouncement(
                                                facAnnouncementController);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFF8FFAC),
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
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Batch',
                        style: TextStyle(
                          color: const Color(0xFF0D6858),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        'Announcement',
                        style: TextStyle(
                          color: const Color(0xFF0D6858),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.0.w),
                    child: Stack(
                      children: [
                        Container(
                          width: 380.w,
                          height: 430.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FFAC),
                            border: Border.all(
                              color: const Color(0x999B9B9B),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.w),
                            ),
                          ),
                        ),
                        Container(
                          width: 95.w,
                          height: 430.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.w),
                              bottomLeft: Radius.circular(20.w),
                            ),
                            border: const Border(
                              left: BorderSide(
                                color: Color(0x999B9B9B),
                              ),
                              top: BorderSide(
                                color: Color(0x999B9B9B),
                              ),
                              bottom: BorderSide(
                                color: Color(0x999B9B9B),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 380.w,
                          height: 430.h,
                          child: GetBuilder<FacAnnouncementController>(
                            builder: (facAnnouncementController) {
                              return ListView.separated(
                                itemCount: facAnnouncementController
                                        .facShowAnnouncementModel
                                        .data
                                        ?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onLongPress: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              "Delete Data",
                                              style: TextStyle(
                                                  fontSize: 24.sp,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            content: Text(
                                              "Are you sure you want to delete this data?",
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "NO",
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.green),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "YES",
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: ListTile(
                                      leading: Text(
                                        '${facAnnouncementController.facShowAnnouncementModel.data![index].batch!}-${facAnnouncementController.facShowAnnouncementModel.data![index].section}       ',
                                        style: TextStyle(
                                          color: const Color(0xFF0D6858),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      title: Text(
                                        facAnnouncementController
                                            .facShowAnnouncementModel
                                            .data![index]
                                            .announcement!,
                                        style: TextStyle(
                                          color: const Color(0xFF0D6858),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'At: ${facAnnouncementController.facShowAnnouncementModel.data![index].date!}',
                                        style: TextStyle(
                                          color: const Color(0xFF0D6858),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 1,
                                    indent: 10,
                                    endIndent: 10,
                                  );
                                },
                              );
                            },
                          ),
                        ),
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
    final result = await facAnnouncementController.facAddAnnouncement(
      _taskTEController.text.trim(),
      selectedBatch,
      selectedSection,
      selectedDate,
    );
    if (result) {
      Get.snackbar('Successful!', 'Announcement has been added');
      selectedBatch = null;
      selectedSection = null;
      dateInput.clear();
      _taskTEController.clear();
      setState(() {});
      facAnnouncementController.facShowAnnouncement();
    } else {
      Get.snackbar('Failed!', "Couldn't add announcement!!",
          colorText: Colors.redAccent);
    }
  }
}
