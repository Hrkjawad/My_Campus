class FacShowChatModel {
  String? status;
  List<FacChatData>? data;

  FacShowChatModel({this.status, this.data});

  FacShowChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FacChatData>[];
      json['data'].forEach((v) {
        data?.add(FacChatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FacChatData {
  String? name;
  String? designation;
  String? department;
  String? sId;
  List<Chat>? chat;
  String? timestamp;

  FacChatData(
      {this.name,
      this.designation,
      this.department,
      this.sId,
      this.chat,
      this.timestamp});

  FacChatData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    department = json['department'];
    sId = json['_id'];
    if (json['chat'] != null) {
      chat = <Chat>[];
      json['chat'].forEach((v) {
        chat?.add(Chat.fromJson(v));
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
      data['chat'] = chat?.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Chat {
  String? message;
  String? sender;
  String? sId;
  String? timestamp;

  Chat({this.message, this.sender, this.sId, this.timestamp});

  Chat.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sender = json['sender'];
    sId = json['_id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['sender'] = sender;
    data['_id'] = sId;
    data['timestamp'] = timestamp;
    return data;
  }
}
