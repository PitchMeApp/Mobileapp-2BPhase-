class UserLoginModel {
  String? message;
  String? token;
  User? user;

  UserLoginModel({this.message, this.token, this.user});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? username;
  String? email;
  String? password;
  String? profilePic;
  int? emailVerify;
  int? flag;
  String? createdAt;
  int? loginType;

  User(
      {this.sId,
        this.username,
        this.email,
        this.password,
        this.profilePic,
        this.emailVerify,
        this.flag,
        this.loginType,
        this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    profilePic = json['profile_pic'];
    emailVerify = json['email_verify'];
    flag = json['flag'];
    createdAt = json['createdAt'];
    loginType = json['log_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profile_pic'] = this.profilePic;
    data['email_verify'] = this.emailVerify;
    data['flag'] = this.flag;
    data['createdAt'] = this.createdAt;
    data['log_type'] = this.loginType;
    return data;
  }
}
