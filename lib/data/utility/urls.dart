class Urls {
  static const String _facultyBaseUrl = 'http://10.0.2.2:2006/api/teacher';
  static const String availableFaculty = '$_facultyBaseUrl/AvailableTeachers';
  static const String facultyReg = '$_facultyBaseUrl/Registration';
  static const String facultyLogin = '$_facultyBaseUrl/Login';
  static const String facultyPassChange = '$_facultyBaseUrl/ProfileUpdate';
  static String facultyVerifyEmail(String email) =>
      '$_facultyBaseUrl/RecoverVerifyEmail/$email';
}
