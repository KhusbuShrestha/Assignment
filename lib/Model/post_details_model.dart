// To parse this JSON data, do
//
//     final postDetailsModel = postDetailsModelFromJson(jsonString);

import 'dart:convert';

PostDetailsModel postDetailsModelFromJson(String str) => PostDetailsModel.fromJson(json.decode(str));

String postDetailsModelToJson(PostDetailsModel data) => json.encode(data.toJson());

class PostDetailsModel {
    PostDetailsModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    int? userId;
    int? id;
    String? title;
    String? body;

    factory PostDetailsModel.fromJson(Map<String, dynamic> json) => PostDetailsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId!,
        "id": id!,
        "title": title!,
        "body": body!,
    };
}
