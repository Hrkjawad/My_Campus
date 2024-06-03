import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// don't touch this file, solved file

class AuthController {
  static String? accessToken, email0, fullName0, designation0, department0;

  static Future<void> setProfileDetails(String token, String email1, String fullName1,
      String designation1, String department1) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    await sharedPreferences.setString('email', email1);
    await sharedPreferences.setString('fullName', fullName1);
    await sharedPreferences.setString('designation', designation1);
    await sharedPreferences.setString('department', department1);
    accessToken = token;
    email0 = email1;
    fullName0 = fullName1;
    designation0 = designation1;
    department0 = designation1;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString('token');
    email0 = sharedPreferences.getString('email');
    fullName0 = sharedPreferences.getString('fullName');
    designation0 = sharedPreferences.getString('designation');
    department0 = sharedPreferences.getString('department');

    if (accessToken == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> clear() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAll(() => const FacSignInScreen());
  }

  static bool get isLoggedIn {
    return accessToken != null;
  }


}
