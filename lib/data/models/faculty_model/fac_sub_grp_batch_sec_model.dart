class FacultyCreatingSubGrpBatchSecModel {
  String? status;
  dynamic data;

  FacultyCreatingSubGrpBatchSecModel({this.status, this.data});

  FacultyCreatingSubGrpBatchSecModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    dynamic jsonData = json['data'];
    if (jsonData != null) {
      if (jsonData is List) {
        // If data is a list, loop through each item and parse it as FacultyCreatingSubGrpBatchSecData
        data = jsonData.map((item) => FacultyCreatingSubGrpBatchSecData.fromJson(item)).toList();
      } else {
        // If data is a map, parse it directly as FacultyCreatingSubGrpBatchSecData
        data = FacultyCreatingSubGrpBatchSecData.fromJson(jsonData);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FacultyCreatingSubGrpBatchSecData {
  String? batch;
  String? courseCode;
  String? courseTitle;
  List<Member>? member;
  String? createdDate;
  String? sId;

  FacultyCreatingSubGrpBatchSecData(
      {this.batch,
      this.courseCode,
      this.courseTitle,
      this.member,
      this.createdDate,
      this.sId});

  FacultyCreatingSubGrpBatchSecData.fromJson(Map<String, dynamic> json) {
    batch = json['batch'];
    courseCode = json['courseCode'];
    courseTitle = json['courseTitle'];
    if (json['member'] != null) {
      member = <Member>[];
      json['member'].forEach((v) {
        member!.add(Member.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['batch'] = batch;
    data['courseCode'] = courseCode;
    data['courseTitle'] = courseTitle;
    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = createdDate;
    data['_id'] = sId;
    return data;
  }
}

class Member {
  String? name;
  String? designation;
  String? department;
  String? sId;
  List<String>? chat; // Changed the type from List<Null>? to List<String>?
  String? timestamp;

  Member({
    this.name,
    this.designation,
    this.department,
    this.sId,
    this.chat,
    this.timestamp,
  });

  Member.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    department = json['department'];
    sId = json['_id'];
    if (json['chat'] != null) {
      chat = <String>[];
      json['chat'].forEach((v) {
        chat!.add(v.toString());
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['designation'] = designation;
    data['department'] = department;
    data['_id'] = sId;
    if (chat != null) {
      data['chat'] = chat!;
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Chat {
  final String message;
  final String sender;
  final String id;
  final DateTime timestamp;

  Chat({
    required this.message,
    required this.sender,
    required this.id,
    required this.timestamp,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      message: json['message'] ?? '',
      sender: json['sender'] ?? '',
      id: json['_id'] ?? '',
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}


class Course {
  final String id;
  final String batch;
  final String courseCode;
  final String courseTitle;
  final String email;
  final List<Member> member;

  Course({
    required this.id,
    required this.batch,
    required this.courseCode,
    required this.courseTitle,
    required this.email,
    required this.member,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    var memberList = json['member'] as List;
    List<Member> member = memberList.map((i) => Member.fromJson(i)).toList();

    return Course(
      id: json['_id'] ?? '',
      batch: json['batch'] ?? '',
      courseCode: json['courseCode'] ?? '',
      courseTitle: json['courseTitle'] ?? '',
      email: json['email'] ?? '',
      member: member,
    );
  }
}
