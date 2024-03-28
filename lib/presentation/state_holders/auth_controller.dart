import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;
  static String? email0, fullName0, designation0, department0;

  static String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String token, {String? email2}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    _accessToken = token;
  }

  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _accessToken = sharedPreferences.getString('token');
  }

  static Future<void> setProfileDetails(String email1,String fullName1,String designation1,String department1) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('email', email1);
    await sharedPreferences.setString('fullName', fullName1);
    await sharedPreferences.setString('designation', designation1);
    await sharedPreferences.setString('department', department1);
    email0 = email1;
    fullName0 = fullName1;
    designation0 = designation1;
    department0 = designation1;

  }

  static Future<void> getProfileDetails() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    email0 = sharedPreferences.getString('email');
    fullName0 = sharedPreferences.getString('fullName');
    designation0 = sharedPreferences.getString('designation');
    department0 = sharedPreferences.getString('department');

    print(email0);
    print(fullName0);
    print(designation0);
    print(department0);
  }

  static Future<void> clear() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAll(() => const FacSignInScreen());
  }

  static bool get isLoggedIn {
    return _accessToken != null;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
