import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'application/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(
    SafeArea(
      child: DevicePreview(
        enabled: false,
        builder: (context) => const MyCampus(),
      ),
    ),
  );
}
