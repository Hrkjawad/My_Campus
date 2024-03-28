import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'application/app.dart';

void main() {
  runApp(
    SafeArea(
      child: DevicePreview(
        enabled: false,
        builder: (context) => const MyCampus(),
      ),
    ),

  );
}
