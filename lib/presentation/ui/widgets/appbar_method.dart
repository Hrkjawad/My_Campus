import 'package:flutter/material.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'app_logo.dart';

AppBar customisedAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
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
    title: Text(
      AuthController.userInfo.facProfileDetailsData.email.toString(),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.logout_outlined,
          color: Colors.red,
        ),
      )
    ],
    centerTitle: true,
  );
}
