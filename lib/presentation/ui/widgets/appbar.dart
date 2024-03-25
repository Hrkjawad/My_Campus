import 'package:flutter/material.dart';
import 'app_logo.dart';

AppBar facAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.25,
    leading: IconButton(
      icon: const AppLogo(),
      onPressed: () {
        scaffoldKey.currentState!.openDrawer();
      },
    ),
    title: const Text('Teacher mail'),
    actions: [
      IconButton(
        onPressed: () {
        },
        icon: const Icon(
          Icons.logout_outlined,
          color: Colors.red,
        ),
      )
    ],
    centerTitle: true,
  );
}