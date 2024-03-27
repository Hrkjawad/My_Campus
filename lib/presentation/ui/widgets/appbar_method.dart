import 'package:flutter/material.dart';
import 'app_logo.dart';

AppBar customisedAppBar(GlobalKey<ScaffoldState> scaffoldKey, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0.25,
    leading: IconButton(
      icon: const AppLogo(),
      onPressed: () {
        scaffoldKey.currentState!.openDrawer();
      },
    ),
    title:  Text(title),
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
