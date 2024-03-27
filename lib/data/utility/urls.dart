class Urls {
  static const String _facultyBaseUrl = 'http://10.0.2.2:2006/api/teacher';
  static const String availableFaculty = '$_facultyBaseUrl/AvailableTeachers';
  static const String facultyReg = '$_facultyBaseUrl/Registration';
  static const String facultySignIn = '$_facultyBaseUrl/Login';
  static const String facultySignup = '$_facultyBaseUrl/ProfileUpdate';
  static String facultyVerifyEmail(String email) =>
      '$_facultyBaseUrl/RecoverVerifyEmail/$email';
  static String facultyVerifyOTP(String email, String otp) =>
      '$_facultyBaseUrl/RecoverVerifyOtp/$email/$otp';
  static String facultyPasswordChange = '$_facultyBaseUrl/RecoverResetPassword';

  static const String _studentBaseUrl = 'http://10.0.2.2:2006/api/teacher';
  static const String availableStudent = '$_studentBaseUrl/AvailableTeachers';
  static const String studentReg = '$_studentBaseUrl/Registration';
  static const String studentSignIn = '$_studentBaseUrl/Login';
  static const String studentSignup = '$_studentBaseUrl/ProfileUpdate';
  static String studentVerifyEmail(String email) =>
      '$_studentBaseUrl/RecoverVerifyEmail/$email';
  static String studentVerifyOTP(String email, String otp) =>
      '$_studentBaseUrl/RecoverVerifyOtp/$email/$otp';
  static String studentPasswordChange = '$_studentBaseUrl/RecoverResetPassword';
}
