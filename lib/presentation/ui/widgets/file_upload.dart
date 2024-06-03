import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_main_bottom_controller.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../state_holders/auth_controller.dart';
import '../../state_holders/faculty_state_holders/fac_resource_controller.dart';
import '../../state_holders/faculty_state_holders/fac_show_group_batch_section_course_controller.dart';
import '../../state_holders/faculty_state_holders/group_chatting_controller.dart';
import '../screens/home_screen.dart';
import 'app_logo.dart';
import 'dropdown_button.dart';

class FileUpload extends StatefulWidget {
  const FileUpload({super.key});

  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {

  String? selectedDate, selectedAnnouncement, selectedBatch, groupId, senderId;
  dynamic c;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<FacResourceController>().showResource();
      c = Get.find<FacShowGroupBatchSectionCourseController>()
          .facultyCreatingSubGrpBatchSecDataList
          ?.map((data) => {
                'batch': data.batch.toString(),
                'sId': data.sId.toString(),
                'senderId':
                    data.member?.map((member) => member.sId.toString()).first
              })
          .toList();
      print('c $c');

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.25,
        leading: const AppLogo(),
        title: const Text("All Resources"),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(
                () => const HomeScreen(),
              );
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.red,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Scaffold(
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomDropdownButton(
                    width: 360.w,
                    height: 45.h,
                    dropDownWidth: 360.w,
                    items: Get.find<FacShowGroupBatchSectionCourseController>()
                            .facultyCreatingSubGrpBatchSecDataList
                            ?.map((data) => data.batch.toString())
                            .toList() ??
                        [],
                    value: selectedBatch,
                    hintText: 'Select Batch',
                    onChanged: (value) {
                      setState(() {
                        selectedBatch = value;
                        if (c != null) {
                          for (var item in c) {
                            if (selectedBatch == item['batch']) {
                              groupId = item['sId'];
                              senderId = item['senderId'].toString();
                              print(senderId);
                            }
                          }
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(14)),
                    child: GetBuilder<FacAnnouncementController>(
                        builder: (facAnnouncementController) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF8FFAC),
                        ),
                        onPressed: () {
                          _pickFiles(facAnnouncementController);
                        },
                        child: const Text('Upload File'),
                      );
                    }),
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      Get.find<FacResourceController>().showResource();
                    },
                    child: GetBuilder<FacResourceController>(
                      builder: (facResourceController) {
                        if (facResourceController.inProgress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return Padding(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil().setWidth(20)),
                            ),
                            child: SizedBox(
                              width: 380.w,
                              height: 520.h,
                              child: ListView.separated(
                                itemCount: facResourceController
                                        .resourceModel.data?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final data = facResourceController
                                      .resourceModel.data![index];
                                  return ListTile(
                                    title: Text(
                                      data.resource.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    trailing: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Sent\n${data.batch}',
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.redAccent,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 1,
                                    height: 6,
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: ColoredBox(
          color: const Color(0xFFCBD0F9),
          child: GetBuilder<FacMainBottomNavController>(
              builder: (facMainBottomNavController) {
            return BackButton(onPressed: facMainBottomNavController.backToHome);
          }),
        ),
      ),
    );
  }

  Future<void> _pickFiles(
      FacAnnouncementController facAnnouncementController) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    final result2 = await Get.find<GroupChattingController>().groupChat(
      groupId!,
      senderId!,
      result!.files.single.name,
      AuthController.fullName0.toString(),
      DateTime.now().toString(),
    );

    if (result2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully uploaded'),
          backgroundColor: Colors.green,
        ),
      );
      await Get.find<FacResourceController>().facUploadResource(
          result.files.single.name, selectedBatch, DateTime.now());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Upload failed'), backgroundColor: Colors.redAccent),
      );
    }
  }
}
