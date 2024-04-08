class Urls {
  static const String _facultyBaseUrl = 'http://10.0.2.2:2006/api/teacher';
  static const String _studentBaseUrl = 'http://10.0.2.2:2006/api/teacher';

  static const String availableFaculty = '$_facultyBaseUrl/AvailableTeachers';
  static const String facultyReg = '$_facultyBaseUrl/Registration';
  static String facultySignIn(email, password) =>
      '$_facultyBaseUrl/Login/$email/$password';
  static const String facultySignup = '$_facultyBaseUrl/ProfileUpdate';
  static String facultyVerifyEmail(String email) =>
      '$_facultyBaseUrl/RecoverVerifyEmail/$email';
  static String facultyVerifyOTP(String email, String otp) =>
      '$_facultyBaseUrl/RecoverVerifyOtp/$email/$otp';
  static const String facultyPasswordChange =
      '$_facultyBaseUrl/RecoverResetPassword';
  static const String facultyList =
      '$_facultyBaseUrl/availableCourseAndTeacher';
  static const String facultyProfileDetails = '$_facultyBaseUrl/ProfileDetails';
  static const String facultySubGrpBatchSec =
      '$_facultyBaseUrl/createSubjectGroupBatchSections/65f6cbde91159aeba9d32433';
  static String facultyAnnouncement(String task, String batch, section, date) =>
      '$_facultyBaseUrl/announcement/$task/$batch/$section/$date';
  static String facultyAddTask(String batch, section, courseTitle, task) =>
      '$_facultyBaseUrl/teacherAddTask/$batch/$section/$courseTitle/$task';
  static String facultyMyToDo(String todo, date) =>
      '$_facultyBaseUrl/facultyMeeting/$todo/$date';
  static String facultyDeleteMyToDo(String id) => '$_facultyBaseUrl/deleteFacultyMeeting/$id';

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
