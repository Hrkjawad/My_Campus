import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_home_screen.dart';
import '../../../state_holders/faculty_state_holders/fac_main_bottom_nav_controller.dart';

class FacMainBottomNavScreen extends StatefulWidget {
  const FacMainBottomNavScreen({super.key});

  @override
  State<FacMainBottomNavScreen> createState() => _FacMainBottomNavScreenState();
}

class _FacMainBottomNavScreenState extends State<FacMainBottomNavScreen> {
  FacMainBottomNavController mainBottomNavController =
      Get.put(FacMainBottomNavController());
  final List<Widget> _screens = [
    const FacHomeScreen(),
    const FacHomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacMainBottomNavController>(
      builder: (navController) {
        return Scaffold(
          body: _screens[navController.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navController.currentSelectedIndex,
            onTap: navController.changeScreen,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 28,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.picture_as_pdf_outlined,
                    size: 28,
                  ),
                  label: 'PDF'),
            ],
          ),
        );
      },
    );
  }
}
