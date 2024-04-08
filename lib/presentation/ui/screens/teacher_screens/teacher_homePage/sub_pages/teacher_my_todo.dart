import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_my_todo_controller.dart';
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
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    'ToDo',
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.0.w),
                  child: Stack(
                    children: [
                      Container(
                        width: 380.w,
                        height: 480.h,
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
                        width: 108.w,
                        height: 480.h,
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
                        height: 478.h,
                        width: 380.w,
                        child: GetBuilder<FacMyToDOController>(
                          builder: (facMyToDOController) {
                            return ListView.separated(
                              itemCount: facMyToDOController
                                      .facMyToDoModel.data?.length ??
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
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.green),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                /*facMyToDOController
                                                    .facDeleteMyToDo(
                                                        facMyToDOController
                                                            .facMyToDoModel
                                                            .data![index]
                                                            .sId!);*/
                                              },
                                              child: Text(
                                                "YES",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
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
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav(
          home: FacHomeScreen(),
        ),
      ),
    );
  }

  Future<void> facMyToDo(FacMyToDOController facMyToDOController) async {
    final result = await facMyToDOController.facMyToDo(
        _todoTEController.text.trim(), _dateInputTEController.text);
    if (result) {
      Get.snackbar('Successful!', 'jhg');
      _todoTEController.clear();
      _dateInputTEController.clear();
    } else {
      Get.snackbar('Failed!', 'jhghjh');
    }
  }

/*  Future<void> deleteDataRow(FacMyToDOController facMyToDOController) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Delete Data",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w900),
          ),
          content: Text(
            "Are you sure you want to delete this data?",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
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
                    fontWeight: FontWeight.w500,
                    color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () {
                facMyToDOController.facDeleteMyToDo(facMyToDOController.facMyToDoModel.data!);
              },
              child: Text(
                "YES",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }*/
}
