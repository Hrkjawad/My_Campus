import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/auth_state_holders/fac_my_todo_controller.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../widgets/appbar_method.dart';
import '../../../../widgets/date_select.dart';
import '../../../../widgets/fac_drawer_method.dart';
import '../../../../widgets/text_fields.dart';
import '../../../../widgets/bottom_nav.dart';
import '../fac_home_screen.dart';

class FacMyTodo extends StatefulWidget {
  const FacMyTodo({super.key});

  @override
  State<FacMyTodo> createState() => _FacMyTodoState();
}

class _FacMyTodoState extends State<FacMyTodo> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedDate, selectedTask;
  List<Map<String, String>> tableData = [];
  final TextEditingController _dateInputTEController = TextEditingController();
  final TextEditingController _todoTEController = TextEditingController();

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 23.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TITLE       :  ",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomTextField(
                    controller: _todoTEController,
                    hintText: 'My todo',
                    height: 44.50.h,
                    width: 258.w,
                    onChanged: (value) {
                      setState(() {
                        selectedTask = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DATE        :  ",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomDatePicker(
                    controller: _dateInputTEController,
                    width: 258.w,
                    height: 44.50.h,
                    onChanged: (value) {
                      setState(() {
                        selectedDate = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 380.w,
                //height: 58.h,
                child: GetBuilder<FacMyToDOController>(
                  builder: (facMyToDOController) {
                    if (facMyToDOController.facMyToDoInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    }
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0.w),
                          side: const BorderSide(
                            color: Color(0x999B9B9B),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (selectedTask != null && selectedDate != null) {
                          print(selectedTask);
                          print(selectedDate);

                          facMyToDo(facMyToDOController);
                        }
                      },
                      child: Text(
                        "ADD",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      color: const Color(0xFF0D6858),
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    'ToDo',
                    style: TextStyle(
                      color: const Color(0xFF0D6858),
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.0.w),
                  child: Stack(
                    children: [
                      Container(
                        width: 380.w,
                        height: 500.h,
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
                        width: 105.w,
                        height: 500.h,
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
                        height: 500.h,
                        width: 380.w,
                        child: GetBuilder<FacMyToDOController>(
                            builder: (facMyToDOController) {
                          return ListView.separated(
                            reverse: true,
                            itemCount: facMyToDOController
                                    .facMyToDoModel.data?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text(
                                  facMyToDOController
                                      .facMyToDoModel.data![index].date!,
                                  style: TextStyle(
                                    color: const Color(0xFF0D6858),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                title: Text(
                                  facMyToDOController
                                      .facMyToDoModel.data![index].title!,
                                  style: TextStyle(
                                    color: const Color(0xFF0D6858),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav(home: FacHomeScreen()),
      ),
    );
  }

  Future<void> facMyToDo(FacMyToDOController facMyToDOController) async {
    final result = await facMyToDOController.facMyToDo(
        _todoTEController.text.trim(), _dateInputTEController.text);
    if (result) {
      Get.snackbar('Successful!', facMyToDOController.message);
      _todoTEController.clear();
      _dateInputTEController.clear();
    } else {
      Get.snackbar('Failed!', facMyToDOController.message);
    }
  }
}
