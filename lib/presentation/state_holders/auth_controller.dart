import 'package:shared_preferences/shared_preferences.dart';
import 'faculty_state_holders/auth_state_holders/fac_profile_details_controller.dart';

class AuthController {
  static String? _accessToken;
  static FacProfileDetailsController userInfo = FacProfileDetailsController();

  static String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String token) async {
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

  static Future<void> setProfileDetails(FacProfileDetailsController userData) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('user-data', userData.toString());
    userInfo = userData;
  }

  static Future<void> getProfileDetails() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    userInfo = sharedPreferences.getString('user_data') as FacProfileDetailsController;
  }

  static Future<void> clear() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
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
