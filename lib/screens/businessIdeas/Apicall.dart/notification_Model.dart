class notification {
  String? message;
  List<Result>? result;
  int? unreadNotification;

  notification({this.message, this.result, this.unreadNotification});

  notification.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    unreadNotification = json['unread_notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['unread_notification'] = this.unreadNotification;
    return data;
  }
}

class Result {
  String? sId;
  String? title;
  String? text;
  int? unreadFlag;
  int? type;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Result(
      {this.sId,
      this.title,
      this.text,
      this.unreadFlag,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    text = json['text'];
    unreadFlag = json['unread_flag'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['text'] = this.text;
    data['unread_flag'] = this.unreadFlag;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
