class NotificationModel {
  int? id;
  int? receiverId;
  String? name;
  int? nameId;
  int? message;
  String? createdAt;
  String? updatedAt;

  NotificationModel(
      {this.id,
        this.receiverId,
        this.name,
        this.nameId,
        this.message,
        this.createdAt,
        this.updatedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    receiverId = json['receiver_id'];
    name = json['name'];
    nameId = json['name_id'];
    message = json['message'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['receiver_id'] = this.receiverId;
    data['name'] = this.name;
    data['name_id'] = this.nameId;
    data['message'] = this.message;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
