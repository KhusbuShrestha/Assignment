// To parse this JSON data, do
//
//     final toDosModel = toDosModelFromJson(jsonString);

import 'dart:convert';

List<ToDosModel> toDosModelFromJson(String str) => List<ToDosModel>.from(json.decode(str).map((x) => ToDosModel.fromJson(x)));

String toDosModelToJson(List<ToDosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDosModel {
    ToDosModel({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    int? userId;
    int? id;
    String? title;
    bool? completed;

    factory ToDosModel.fromJson(Map<String, dynamic> json) => ToDosModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId!,
        "id": id!,
        "title": title!,
        "completed": completed!,
    };
}
