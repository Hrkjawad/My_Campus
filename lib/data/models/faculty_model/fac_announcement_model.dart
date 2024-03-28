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
  String? announcement;
  String? batch;
  String? timestamp;

  FacAnnouncementData(
      {this.sId, this.announcement, this.batch, this.timestamp});

  FacAnnouncementData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    announcement = json['announcement'];
    batch = json['batch'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['announcement'] = announcement;
    data['batch'] = batch;
    data['timestamp'] = timestamp;
    return data;
  }
}
