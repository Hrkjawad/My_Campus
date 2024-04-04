import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../screens/home_screen.dart';
import 'app_logo.dart';
class FileUpload extends StatefulWidget {
  const FileUpload({super.key});

  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  List<String> uploadedFiles = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        uploadedFiles.add(result.files.single.name);
      });
    }
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.25,
        leading: const AppLogo(),
        title:  const Text("All Resources"),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               SizedBox(
                height: 10.h,
              ),
              Padding(
                padding:  EdgeInsets.all(ScreenUtil().setWidth(16)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF8FFAC),
                  ),
                  onPressed: _pickFiles,
                  child: const Text('Upload File'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
                    ),
                    child: SizedBox(
                      width: 380.w,
                      height: 550.h,
                      child: ListView.builder(
                        itemCount: uploadedFiles.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Center(child: Text(uploadedFiles[index])),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const ColoredBox( color: Color(0xFFCBD0F9),
            child: BackButton(),
      ),
      ),
    );
  }
}
