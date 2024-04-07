class FacAnnouncementModel {
  String? status;
  List<FacAnnouncementData>? data;

  FacAnnouncementModel({this.status, this.data});

  FacAnnouncementModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FacAnnouncementData>[];
      json['data'].forEach((v) {
        data!.add(FacAnnouncementData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FacAnnouncementData {
  String? sId;
  String? email;
  String? announcement;
  String? batch;
  String? timestamp;
  String? section;
  String? date;

  FacAnnouncementData(
      {this.sId,
      this.email,
      this.announcement,
      this.batch,
      this.timestamp,
      this.section,
      this.date});

  FacAnnouncementData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    announcement = json['announcement'];
    batch = json['batch'];
    timestamp = json['timestamp'];
    section = json['section'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['announcement'] = announcement;
    data['batch'] = batch;
    data['timestamp'] = timestamp;
    data['section'] = section;
    data['date'] = date;
    return data;
  }
}
