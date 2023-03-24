// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.message,
    this.result,
  });

  String? message;
  List<Result>? result;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.type,
    required this.file,
    required this.text,
    required this.flag,
    required this.createdAt,
    this.title,
  });

  String id;
  int type;
  String file;
  String text;
  int flag;
  DateTime createdAt;
  dynamic? title;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        type: json["type"],
        file: json["file"],
        text: json["text"],
        flag: json["flag"],
        createdAt: DateTime.parse(json["createdAt"]),
        title: "title", //json["title"] != null
        //     ? titleValues.map[json["title"]]
        //     : titleValues.map[""],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "file": file,
        "text": text,
        "flag": flag,
        "createdAt": createdAt.toIso8601String(),
        "title": "title"
        // "title": (title != null)
        //     ? titleValues.reverse![title]
        //     : titleValues.reverse?[""],
      };
}

enum Title { TITLE }

final titleValues = EnumValues({"title": Title.TITLE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
